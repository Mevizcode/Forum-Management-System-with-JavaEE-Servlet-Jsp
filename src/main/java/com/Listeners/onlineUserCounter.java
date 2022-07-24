package com.Listeners;

public class onlineUserCounter {
    public static int counter = 0;

    public static int getOnlineUserNumber(){
        return counter;
    }

    public static void raise(){
       counter++;
    }

    public static void reduce(){
        counter--;
    }
}
