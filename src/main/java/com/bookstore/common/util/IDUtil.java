package com.bookstore.common.util;

import java.util.Random;
import java.util.UUID;

public class IDUtil {

    //id 生成
    public static int getId(){

        Random random = new Random();
        int end2 = random.nextInt(999999);
        String str = String.format("%06d",end2);
        Integer id = new Integer(str);
        return id;
    }

    //图片id 文件id 生成

    public static String generateDocumentName() {
        String str = UUID.randomUUID().toString();
        return str;
    }

    public static void main(String[] args) {
        System.out.println(getId());
        System.out.println(generateDocumentName());
    }
}
