package com.DAO;

import com.Entity.User;
import com.Entity.UserLog;
import com.Util.dbUtil;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class UserDao {

    private static final Logger logger = Logger.getLogger(Logger.class);
    private static final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd 'at' HH:mm:ss");
    private static final LocalDateTime now = LocalDateTime.now();

    public List<User> getUsers(List<User> userList, String sql) throws SQLException {
        ResultSet rs = dbUtil.query(sql);
        return getUsers(userList, rs);
    }

    public List<User> queryAllUser(){
        List<User> userList = new ArrayList<>();
        try{
            String sql = "select * from user_management.users;";
            return getUsers(userList, sql);
        }catch (Exception e){
         e.printStackTrace();
         logger.error(e);
         logger.warn("Failed to query all users! Please check userLog fro more info.");
        }
     return null;
    }

    public List<User> getUsers(List<User> userList, ResultSet rs) throws SQLException {
        while (rs.next()){
            User user = new User();
            user.setId(rs.getString("id"));
            user.setUsername(rs.getString("username"));
            user.setEmail(rs.getString("email"));
            user.setFirstName(rs.getString("first_name"));
            user.setLastName(rs.getString("last_name"));
            user.setGender(rs.getString("gender"));
            user.setBirthday(rs.getDate("birthday"));
            user.setAge(rs.getInt("age"));
            user.setAddress(rs.getString("address"));
            user.setMobile(rs.getString("mobile"));
            user.setPassword(rs.getString("password"));
            user.setCreatedOn(rs.getTimestamp("created_on"));
            userList.add(user);
        }
        return userList;
    }


    public boolean registerUser(User user) {
        boolean result = false;
        String userID = UUID.randomUUID().toString();
        String sql = "insert into user_management.users(id," +
                "username," +
                "email," +
                "first_name," +
                "last_name," +
                "password, created_on) " +
                "values(?,?,?,?,?,?, CURRENT_TIMESTAMP);";
        try{
            result = dbUtil.cud(sql,
                    userID,
                    user.getUsername(),
                    user.getEmail(),
                    user.getFirstName(),
                    user.getLastName(),
                    user.getPassword());
            logger.info(user.getUsername()+" Registered at "+dateTimeFormatter.format(now));
            dbUtil.close();
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e);
            logger.warn("Unable to register user, please check userLog");
        }
        return result;
    }

    public boolean checkLogin(User user, HttpServletRequest request) {
        boolean userLog = false;
        String sql = "select * from user_management.users where username = ? and password = ?;";
        ResultSet rs = null;
        try{
            rs = dbUtil.query(sql,user.getUsername(),user.getPassword());
            if(rs.next()){
                logger.info(user.getUsername()+" Login successfully at "+dateTimeFormatter.format(now));
                userLog = userLoginLogs(rs.getString(1),request);
                if(userLog){
                    logger.info("user logged successful");
                }else{
                    logger.warn("unable to log user");
                }
                return true;
            }
            dbUtil.close();
            rs.close();
        }catch (Exception e){
            e.printStackTrace();
            logger.warn(user.getUsername()+" Login failed at "+dateTimeFormatter.format(now), new Throwable(e));
        }
      return false;
    }

    private boolean userLoginLogs(String UserID, HttpServletRequest request) {
        boolean result = false;
        String logID = UUID.randomUUID().toString();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
        String currentTime = simpleDateFormat.format(new java.util.Date(System.currentTimeMillis()));

        String clientInfo = request.getHeader("user-agent");
        StringTokenizer stk = new StringTokenizer(clientInfo, ";");
        String clientBrowser = stk.nextToken();
        String clientOS = stk.nextToken();
        String clientIP = getClientIP(request);
        int active_status = 1;// set active status to 1

        UserLog userLog = new UserLog(logID, currentTime,clientIP,UserID,clientOS,clientBrowser,active_status);
        try{
            String sql = "insert into user_management.user_log(id,login_time,clientIP,userId,clientOS,clientBrowser,active_status) values(?,?,?,?,?,?,?);";
            result = dbUtil.cud(sql,logID,userLog.getLoginTime(),userLog.getClientIp(),userLog.getUserId(),userLog.getClientOs(),userLog.getClientBrowser(), userLog.getActive_status());
            logger.info("User log added and active status changed to 1 at "+dateTimeFormatter.format(now));
        }catch (Exception e){
            e.printStackTrace();
            logger.warn("cannot set user logs", new Throwable(e));
        }
        return result;
    }

    public boolean setLogoutTime(User user, UserLog userLog){
        boolean result = false;
        try{ //, active_status = 0
            String sql = "update user_management.user_log set logout_time = ?" +
                    "where userId =  (select id from user_management.users where username = ?) " +
                    "order by STR_TO_DATE (concat(substring_index(login_time, 'at', 1), ' '," +
                    " left(right(login_time, 13),9)), '%Y-%m-%d %H:%i:%s') desc limit 1";
            result = dbUtil.cud(sql, userLog.getLogoutTime(),user.getUsername());
            logger.info(user.getUsername()+" Logged out successfully at "+userLog.getLogoutTime());
        }catch (Exception e){
            e.printStackTrace();
            logger.warn(" Unable to logged out", new Throwable(e));
        }
        return result;
    }
    public boolean updateActiveStatus(UserLog userLog){
        boolean result = false;
        String sql = "update user_log set active_status = 0 where logout_time is not null;";
        try {
            result = dbUtil.cud(sql);
            logger.info("User logged out! Active Status changed to 0");
        } catch (SQLException e) {
            e.printStackTrace();
            logger.warn("User logged out! Active status not changed", new Throwable(e));
        }
        return result;
    }

    public boolean addUser(User user) {
        boolean result = false;
        String userId = UUID.randomUUID().toString();

        try{
            String sql = "insert into user_management.users(" +
                    "id,username,email,first_name,last_name,gender,birthday,age,address,mobile,password,created_on)" +
                    "values(?,?,?,?,?,?,?,?,?,?,?, CURRENT_TIMESTAMP);";
            result = dbUtil.cud(sql,
                    userId,
                    user.getUsername(),
                    user.getEmail(),
                    user.getFirstName(),
                    user.getLastName(),
                    user.getGender(),
                    user.getBirthday(),
                    user.getAge(),
                    user.getAddress(),
                    user.getMobile(),
                    user.getPassword());
            logger.info(user.getUsername() + " Registered! New User Added at "+dateTimeFormatter.format(now));
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e);
            logger.warn("Unable to add new user, Please check the error log");
        }
        return result;
    }

    public boolean updateUser(User user) {
        boolean result = false;
        try{
            String sql = "update user_management.users set username=?," +
                    "email=?," +
                    "first_name=?," +
                    "last_name=?," +
                    "gender=?," +
                    "birthday=?," +
                    "age=?," +
                    "address=?," +
                    "mobile=?," +
                    "password=? where id = ?;";

            result = dbUtil.cud(sql,
                    user.getUsername(),
                    user.getEmail(),
                    user.getFirstName(),
                    user.getLastName(),
                    user.getGender(),
                    user.getBirthday(),
                    user.getAge(),
                    user.getAddress(),
                    user.getMobile(),
                    user.getPassword(),
                    user.getId());
            logger.info(user.getUsername() +" updated his/her info at "+dateTimeFormatter.format(now));
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e);
            logger.warn("unable to update "+user.getUsername()+" info, Please check error log");
        }
        return result;
    }

    public boolean deleteUser(String id) {
        boolean result = false;
        try{
            String sql = "delete from user_management.users where id='"+id+"';";
            result = dbUtil.cud(sql);
            logger.info(id+" deleted successfully!");
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e);
            logger.warn("unable to delete user with ID::"+id+" at "+dateTimeFormatter.format(now));
        }
        return result;
    }

    public ResultSet queryUserByUsername(String id) {
    ResultSet rs = null;
    try{
        String sql = "select * from user_management.users where id = '"+id+"';";
        rs = dbUtil.query(sql);
    }catch (Exception e){
        e.printStackTrace();
    }
    return rs;
    }

    public List<User> searchUser(String searchStr, int startIndex, int pageSize) {
        List<User> usersList = new ArrayList<>();
        try {
            String sql = "select * from user_management.users where username like '%" + searchStr + "%' limit ?,?;";
            ResultSet rs = dbUtil.query(sql, startIndex, pageSize);
            return getUsers(usersList, rs);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public List<User> searchUserCount(String searchStr){
        List<User> searchList = new ArrayList<>();
        try{
         String sql = "select * from user_management.users where username like '%" + searchStr + "%';";
            return getUsers(searchList, sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<User> queryUserByName(String username){
        List<User> listUser = new ArrayList<>();
        try{
            String sql = "select * from users where username = '"+username+"';";
            ResultSet rs = dbUtil.query(sql);
            return getUsers(listUser, rs);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public List<User> listUsersByPage(int startIndex, int pageSize){
        String sql = "select * from user_management.users limit ?,?";
        List<User> usersList = new ArrayList<>();
        try{
            ResultSet rs = dbUtil.query(sql, startIndex, pageSize);
            return getUsers(usersList, rs);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public ResultSet getUserLogDetails(String username){
        ResultSet rs = null;
        try{
            String sql = "select userId,login_time,logout_time from user_management.user_log " +
                    "where userId = (select id from user_management.users where username = '"+ username +"') " +
                    "order by logout_time desc limit 1;";
            rs = dbUtil.query(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }


    public ResultSet queryUserGenders(){
        ResultSet rs = null;
        try{
            String sql = "select count(*) GenderNum,\n" +
                    "       case Gender when 'Male' then 'Male'\n" +
                    "           when 'Female' then 'Female' end as Gender\n" +
                    "from users group by Gender;";
            rs = dbUtil.query(sql);
        }catch (Exception e){
            e.printStackTrace();
        }
        return  rs;
    }

    //query total logins per day
    public ResultSet queryDailyLogin(){
        ResultSet rs = null;
        try{
            String sql = "select\n" +
                    "       sum(date(login_time) = date(curdate())) as Today,\n" +
                    "       sum(date(login_time) = date(date(curdate())-1)) as Yesterday,\n" +
                    "       sum(date(login_time) = date(date(curdate())-2)) as 2_days_ago,\n" +
                    "       sum(date(login_time) = date(date(curdate())-3)) as 3_days_ago,\n" +
                    "       sum(date(login_time) = date(date(curdate())-4)) as 4_days_ago\n" +
                    "from user_log;";
            rs = dbUtil.query(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    //set user active time
    public boolean setActiveTime(User user, UserLog userLog){
        boolean result = false;
        try{
            String sql = "update  `user_management`.`user_log` set active_time = ? where userId =  " +
                    "(select id from user_management.users where username = ?) order by logout_time desc limit 1;";
            result = dbUtil.cud(sql, userLog.getActive_time(),user.getUsername());
            logger.info("Active time Set "+ user.getUsername()+ " spend "+userLog.getActive_time()+" on our website!");

        }catch (Exception e){
            e.printStackTrace();
            logger.error(e);
            logger.warn("Unable to set "+user.getUsername()+ " active time! Please check the error logs");
        }
        return  result;
    }

    //query total active time per user
    public ResultSet queryUserByActiveTime(){
        ResultSet rs = null;
        try{
            String sql = "select  username, sum(cast(TIME_TO_SEC(active_time)/60 as decimal (36, 1))) as active_time\n" +
                    "from user_log\n" +
                    "inner join users u on user_log.userId =  u.id\n" +
                    "where active_time IS NOT NULL and username != 'admin' group by username\n" +
                    "order by active_time desc  limit 3;";
            rs = dbUtil.query(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    //check if username exist
    public ResultSet checkUsernameExist(String username){
        ResultSet  rs = null;
        try{
            String sql = "select * from user_management.users where username='"+username+"';";
            rs = dbUtil.query(sql);
        } catch (SQLException e) {
            e.printStackTrace();
            logger.error(e);
            logger.warn("Unable to query user with username "+username);
        }
        return rs;
    }

    //check if  email Exist
    public ResultSet checkEmailExist(String email){
        ResultSet rs = null;
        try{
            String sql = "select * from user_management.users where email='"+email+"';";
            rs = dbUtil.query(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    //update user password
    public boolean updatePassword(String password, String id){
        boolean result = false;
        try{
            String sql = "update user_management.users set password = ? where id=?;";
            result = dbUtil.cud(sql,password,id);
            logger.info("User with ID::"+id+" updated his/her password at "+dateTimeFormatter.format(now));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet queryUserOldPassword(String username){
        ResultSet rs = null;
        try{
            String sql = "select password from users where username = '"+username+"';";
            rs = dbUtil.query(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    //query users login times
    public ResultSet queryUserLoginTimes(){
        ResultSet rs = null;
        try {
        String sql = "select username, count(1)  " +
                "from user_log inner join users jtu on user_log.userId = jtu.id group by username order by count(1) desc;";
        rs = dbUtil.query(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    //list newly added user by created Time
    public List<User> queryNewlyAddedUser(){
        String sql = "select * from users order by created_on desc limit 10;";
        List<User> newestUserList = new ArrayList<>();
        try{
            return getUsers(newestUserList, sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //get user active_status
    public ResultSet getActiveUser(){
        ResultSet rs = null;
        try {
            String sql = "select count(active_status) from\n" +
                    "user_log inner join users u on user_log.userId = u.id where active_status=1;";
            rs = dbUtil.query(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    //query user maximum active time
    public ResultSet queryMaxActiveTimePerUser(){
        ResultSet rs = null;
        String sql = "select username, max(active_time)  from users join user_log ul on users.id = ul.userId " +
                "group by username order by max(active_time) desc;";
        try {
             rs = dbUtil.query(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }


    //get user IP
    public static String getClientIP(HttpServletRequest request) {
        String fromSource = "X-Real-IP";
        String ip = request.getHeader("X-Real-IP");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Forwarded-For");
            fromSource = "X-Forwarded-For";
        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
            fromSource = "Proxy-Client-IP";
        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
            fromSource = "WL-Proxy-Client-IP";
        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
            fromSource = "request.getRemoteAddr";
        }
        logger.info("App Client IP: " + ip + ", fromSource: " + fromSource);
        return ip;
    }
}
