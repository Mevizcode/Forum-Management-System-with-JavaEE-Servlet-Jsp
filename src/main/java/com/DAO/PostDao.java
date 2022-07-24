package com.DAO;

import com.Entity.Posts;
import com.Entity.Thread;
import com.Util.dbUtil;
import org.apache.log4j.Logger;
import org.junit.Test;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Random;


public class PostDao {
    private static final Logger logger = Logger.getLogger(Logger.class);
    private static final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd 'at' HH:mm:ss");
    private static final SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private static final LocalDateTime now = LocalDateTime.now();
    private static final Random rnd = new Random();


    public boolean insertNewPost(String username, Posts posts) throws SQLException {
        boolean result = false;
        int number = rnd.nextInt(999999);
        String postID = String.valueOf(number);
        String createdOn = formatter.format(new java.util.Date(System.currentTimeMillis()));
        String sql = "insert into user_management.posts (postId, createdOn, title, content, postedBy, userId) " +
                "values (?, ?, ?, ?, '"+username+"', (select userId from users t1 inner join user_log t2 on t1.id = t2.userId where t2.active_status = 1 and t1.username = '"+username+"' order by login_time desc limit 1));";
        result = dbUtil.cud(sql, postID, createdOn, posts.getTitle(), posts.getContent());
        logger.info("New Post added by "+username+" at "+dateTimeFormatter.format(now));
        return result;
    }

    public ResultSet queryUserActiveStatus(){
        String sql = "select l.id, l.login_time, u.username from user_log l left join users u on u.id = l.userId  where active_status = 1;";
        ResultSet resultSet = null;
        try {
            resultSet = dbUtil.query(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    public List<Posts> queryAllPost(){
        List<Posts> postsList = new ArrayList<>();
        String sql = "select title, content, createdOn, postId, postedBy from posts;";
        try {
            ResultSet rs = dbUtil.query(sql);
            while(rs.next()){
                Posts posts = new Posts();
                posts.setTitle(rs.getString("title"));
                posts.setContent(rs.getString("content"));
                posts.setCreatedOn(rs.getTimestamp("createdOn"));
                posts.setPostId(rs.getInt("postId"));
                posts.setPostedBy(rs.getString("postedBy"));
                postsList.add(posts);
            }
            return postsList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ResultSet queryPost(String postId){
        String sql = "select * from posts where postId = '"+postId+"';";
        ResultSet rs_queryPost = null;
        try {
            rs_queryPost = dbUtil.query(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs_queryPost;
    }

    public List<Thread> queryThreadPerPost(String postID){
        List<Thread> listThreadPerPost = new ArrayList<>();
        ResultSet rs = null;
        String sql = "select * from thread where postId = '"+postID+"';";
        try {
            rs = dbUtil.query(sql);
            while (rs.next()){
                Thread userThread = new Thread();
                userThread.setThreadId(rs.getInt("threadId"));
                userThread.setUserId(rs.getString("userId"));
                userThread.setThreadCreatedOn(rs.getTimestamp("threadCreatedOn"));
                userThread.setSubject(rs.getString("subject"));
                userThread.setPostId(rs.getInt("postId"));
                userThread.setCreatedBy(rs.getString("createdBy"));
                listThreadPerPost.add(userThread);
            }
            return listThreadPerPost;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean insertThreadAnswer(String username, Thread thread, String postId){
        boolean result = false;
        int generateID = rnd.nextInt(99999999);
        String threadID = String.valueOf(generateID);
        String threadCreatedOn = formatter.format(new java.util.Date(System.currentTimeMillis()));
        String sql = "insert into user_management.thread (threadId, userId, threadCreatedOn, subject, createdBy, postId) " +
                "VALUES (?, (select userId from users t1 inner join user_log t2 on t1.id = t2.userId " +
                "where t2.active_status = 1 and t1.username = '"+username+"' " +
                "order by login_time desc limit 1), ?, ?, '"+username+"', '"+postId+"');";
        try {
            result = dbUtil.cud(sql, threadID, threadCreatedOn, thread.getSubject());
            logger.info("New thread inserted by "+username+" at "+dateTimeFormatter.format(now));
        } catch (SQLException e) {
            e.printStackTrace();
            logger.warn("Unable to insert new thread answer", new Throwable(e));
        }
        return result;
    }

    public ResultSet countTotalPosts(){
        ResultSet rs = null;
        String sql = "select count(*) from posts;";
        try {
            rs = dbUtil.query(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public List<Posts> queryPostsByTitle(){
        List<Posts> listPostsById = new ArrayList<>();
        String sql = "select title from posts right join thread t on posts.postId = t.postId\n" +
                "where t.postId is not null group by title order by title  desc limit 5;";
        try {
            ResultSet rs = dbUtil.query(sql);
            while (rs.next()){
                Posts posts = new Posts();
                posts.setTitle(rs.getString("title"));
                listPostsById.add(posts);
            }
            return listPostsById;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public List<Posts> queryLatestInsertPost(String username){
        List<Posts> listLatestPost = new ArrayList<>();
        String sql = "select * from posts p inner join users u on p.userId = u.id where" +
                " u.username = '"+username+"' order by createdOn desc limit 1;\n";

        ResultSet rs = null;
        try {
             rs = dbUtil.query(sql);
            while (rs.next()) {
                Posts post = new Posts();
                post.setPostedBy(rs.getString("postedBy"));
                post.setPostId(rs.getInt("postId"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setCreatedOn(rs.getTimestamp("createdOn"));
                listLatestPost.add(post);
            }
            return listLatestPost;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

}
