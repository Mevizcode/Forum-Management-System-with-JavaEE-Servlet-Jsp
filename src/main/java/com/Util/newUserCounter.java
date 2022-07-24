package com.Util;

public class newUserCounter {

    private static int countNewUsers = 0;

    public static int getCountNewUsers() {
        return countNewUsers;
    }

   /** public static void setCountNewUsers(int countNewUsers) {
        newUserCounter.countNewUsers = countNewUsers;
    }**/

    public static int raise(){
      return countNewUsers++;
    }

}