<%@ page import="java.awt.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    //to generate some random colors
    public Color getColor(){
        Random random = new Random();
        int red  = random.nextInt(256);
        int blue  = random.nextInt(256);
        int green  = random.nextInt(256);
        return new Color(red, green, blue);
    }

    //randomly generate 4 digit validation code from 1000 - 9999
    public String getNum(){
        Random random = new Random();
        String ImageCode = (Long.toString(Math.abs(random.nextLong()), 36)).substring(0, 4);
        //int random = (int) (Math.random() * 9000) + 1000;
        return ImageCode;
    }
%>
<%
    //prevent broswer from caching
    response.setHeader("Cache-control","no-cache");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires", 0);

    //Draw an image
    BufferedImage image = new BufferedImage(90, 40, BufferedImage.TYPE_INT_RGB);

    //Define a paintbrush
    Graphics graphics = image.getGraphics();

    //Draw background
    graphics.fillRect(0,0, 90,40);

    for(int i=0; i<60; i++){ //Generate 70 lines to the background
        Random random = new Random();
        int xBegin = random.nextInt(90);
        int yBegin = random.nextInt(40);
        int xEnd = random.nextInt(xBegin + 10);
        int yEnd = random.nextInt(yBegin + 10);
        graphics.setColor(getColor());
        graphics.drawLine(xBegin, yBegin, xEnd, yEnd);
    }

    graphics.setFont(new Font("Times New Roman", Font.BOLD, 24)); //set the font family and size

    //Draw the check code
    graphics.setColor(Color.darkGray);
    String checkCode = getNum();
    StringBuffer stringBuffer = new StringBuffer();

    for (int i=0; i<checkCode.length(); i++){
        stringBuffer.append(checkCode.charAt(i)).append(" "); //add space after each letter
    }
    //10px width 25px height of the digits
    graphics.drawString(stringBuffer.toString(), 10, 25);
    session.setAttribute("captcha_security",checkCode);
    ImageIO.write(image, "jpeg", response.getOutputStream());
    out.clear();
    out = pageContext.pushBody();
%>