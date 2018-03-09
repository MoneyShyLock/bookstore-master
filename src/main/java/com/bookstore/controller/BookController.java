package com.bookstore.controller;

import com.bookstore.common.util.DateUtil;
import com.bookstore.common.util.IDUtil;
import com.bookstore.common.util.JsonUtils;
import com.bookstore.common.util.MessageResult;
import com.bookstore.pojo.po.Book;
import com.bookstore.pojo.po.BookCategory;
import com.bookstore.pojo.po.Warehouse;
import com.bookstore.pojo.vo.BookCategoryVo;
import com.bookstore.pojo.vo.BookVO;
import com.bookstore.pojo.vo.CountBook;
import com.bookstore.service.BookCategoryService;
import com.bookstore.service.BookService;
import com.bookstore.service.WarehouseService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.*;

//图书控制器
@Controller
public class BookController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private BookCategoryService bookCategoryService;
    @Autowired
    private BookService bookService;
    @Autowired
    private WarehouseService warehouseService;

    //查询所有的图书  默认按照书名的模糊查询
    @RequestMapping(value = "/listBooks")
    public String listAdmins(Model model, @RequestParam(value = "pn", defaultValue = "1") Integer pn, @RequestParam(defaultValue = "") String query, HttpSession session) {
        String encodeQuery = null;
        try {
            encodeQuery = java.net.URLDecoder.decode(query, "UTF-8");
            System.out.println(encodeQuery);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        PageHelper.startPage(pn, 4);
        List<Book> bookList = bookService.listBooks(query);
        PageInfo<Book> pageInfo = new PageInfo(bookList);
        session.setAttribute("query", encodeQuery);
        model.addAttribute("pageInfo", pageInfo);
        return "book_list";
    }

    // 上架
    @RequestMapping("/upBook/{ids}")
    @ResponseBody
    public MessageResult upBook(@PathVariable List<Long> ids) {

        MessageResult mr = null;
        try {
            mr = bookService.upBook(ids);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return mr;
    }

    //下架
    @RequestMapping("/downBook/{ids}")
    @ResponseBody
    public MessageResult downBook(@PathVariable List<Long> ids) {

        MessageResult mr = null;
        try {
            mr = bookService.downBook(ids);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return mr;
    }

    //入库
    @RequestMapping("/addInventory/{ids}/{inventory}/{isbn}")
    @ResponseBody
    public MessageResult addBookInventory(@PathVariable Long ids, @PathVariable int inventory, @PathVariable String isbn) {

        MessageResult mr = new MessageResult();
        try {
            BookVO bookVO = bookService.getBookForBack(ids);
            //设值
            Book book = new Book();
            book.setId(ids);
            book.setInventory(bookVO.getInventory() + inventory);
            book.setIsbn(isbn);
            //更新库存
            bookService.updateInventory(book);
            //添加入库记录
            Warehouse warehouse = new Warehouse();
            warehouse.setBookId(ids);
            //获取当前的年月周
            Calendar date = Calendar.getInstance();
            int year = Integer.valueOf(date.get(Calendar.YEAR));
            int month = Integer.valueOf(date.get(Calendar.MONTH))+1;
            int week = date.get(Calendar.WEEK_OF_MONTH);
            //初始化数据
            warehouse.setTime(new Date());
            warehouse.setYear(year);
            warehouse.setMonth(month);
            warehouse.setWeek(week);
            warehouse.setEntryCount(new Long(inventory));
            warehouse.setInventory(new Long(bookVO.getInventory() + inventory));
            warehouse.setBookNumber(new Long(inventory));//入库数量
            warehouseService.add(warehouse);

            mr.setMessage("success");

        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            mr.setMessage("error");
        }
        return mr;
    }

    //出库
    @RequestMapping("/subInventory/{ids}/{inventory}/{price}")
    @ResponseBody
    public MessageResult subBookInventory(@PathVariable Long ids, @PathVariable int inventory, @PathVariable BigDecimal price) {
        MessageResult mr = new MessageResult();
        try {
            BookVO bookVO = bookService.getBookForBack(ids);
            //设值
            Book book = new Book();
            book.setId(ids);
            book.setInventory(bookVO.getInventory() - inventory);
            book.setPrice(price);
            //更新库存
            bookService.updateInventory(book);
            //添加出库记录
            Warehouse warehouse = new Warehouse();
            warehouse.setBookId(ids);
            //获取当前的年月日
            Calendar date = Calendar.getInstance();
            int year = Integer.valueOf(date.get(Calendar.YEAR));
            int month = Integer.valueOf(date.get(Calendar.MONTH))+1;
            int week = date.get(Calendar.WEEK_OF_MONTH);
            //初始化数据
            warehouse.setTime(new Date());
            warehouse.setYear(year);
            warehouse.setMonth(month);
            warehouse.setWeek(week);
            warehouse.setDeliveryCount(new Long(inventory));
            warehouse.setBookNumber(new Long(inventory));
            warehouse.setInventory(new Long(bookVO.getInventory() - inventory));//库存
            warehouse.setBookNumber(new Long(inventory));//出库数量
            warehouseService.add(warehouse);
            mr.setMessage("success");

        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            mr.setMessage("error");
        }
        return mr;
    }

    //图书详情
    @ResponseBody
    @RequestMapping("/bookById")
    public BookVO getBookById(Long id) {
        BookVO bookVO = bookService.getBookForBack(id);
        return bookVO;
    }


    @RequestMapping("/upload/UploadController")
    public MessageResult springUpload(Book book, HttpServletRequest request) throws IllegalStateException, IOException {
        String imagePath = "";
        //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        //检查form中是否有enctype="multipart/form-data"
        if (multipartResolver.isMultipart(request)) {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            //获取multiRequest 中所有的文件名
            Iterator iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                //遍历所有文件
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    System.out.println(file.getOriginalFilename());
                    int i = file.getOriginalFilename().lastIndexOf(".");
                    String suffixName = file.getOriginalFilename().substring(i, file.getOriginalFilename().length());
                    String basePath = "F:/IdeaWorkSpace/bookstore-master/src/main/webapp/";
                    imagePath = "images/" + IDUtil.generateDocumentName() + suffixName;
                    //上传
                    file.transferTo(new File(basePath + imagePath));
                }
            }
        }
        book.setCreated(new Date());
        book.setSalesVolume(0);
        book.setImage(imagePath);
        MessageResult messageResult = bookService.saveBook(book);
        return messageResult;
    }

    @ResponseBody
    @RequestMapping("/book/category")
    public List<BookCategory> listBookCategories() {

        List<BookCategory> list = null;
        try {
            list = bookCategoryService.listBookCategories();
        } catch (Exception e) {

            logger.error(e.getMessage(), e);
        }
        return list;
    }

    //统计书籍分类的数量
    @RequestMapping("/countBooks")
    public String bookCategory(Model model) {
        CountBook countBook = bookService.countBook();
        model.addAttribute("result", countBook);
        return "echarts_book";
    }

    //统计入库图书
    /**
     *  入库图书页面跳转，初始化页面数据
     */
    @GetMapping("echartsPutInBook")
    public String echartsPutInBook(Model model,HttpSession session,@RequestParam(value = "type",defaultValue = "0") int type) {
        //获取所有入书出库数据
        List<Warehouse> warehousAll=warehouseService.listPutBook();
        CountBook countBook=new CountBook();
        for(Warehouse warehouse:warehousAll){
            Book bookVO = bookService.getBookById(warehouse.getBookId());
            countBook=countBook(countBook, warehouse, bookVO);
        }
        session.setAttribute("putAll",countBook);
        Calendar date = Calendar.getInstance();
        int month = Integer.valueOf(date.get(Calendar.MONTH))+1;
        //获取本月数据
        List<Warehouse> warehouses = warehouseService.listPutBook(0,month);
        Calendar calendar = Calendar.getInstance();
        int week=0;
        //判断今天是第几周
        week=calendar.get(Calendar.WEEK_OF_MONTH);
        //获取本周的数据
        int year=Integer.valueOf(date.get(Calendar.YEAR));
        List<Warehouse> weeks=warehouseService.listPutBook(year,month,week);
        List<CountBook> weekBooks = new ArrayList<CountBook>();
        CountBook Sun = new CountBook();
        CountBook Mon = new CountBook();
        CountBook Thu = new CountBook();
        CountBook Web = new CountBook();
        CountBook Tu = new CountBook();
        CountBook Fri = new CountBook();
        CountBook Sta = new CountBook();
        //处理周数据
        for (Warehouse warehouse : warehouses) {
            Book bookVO = bookService.getBookById(warehouse.getBookId());
            calendar.setTime(warehouse.getTime());
            //判断入库时间是本周的周几，1是周日 7是周六
            int day;
            day=calendar.get(Calendar.DAY_OF_WEEK);
            if (day == 1) {
                Sun = countBook(Sun, warehouse, bookVO);
            } else if (day == 2) {
                Mon = countBook(Mon, warehouse, bookVO);
            } else if (day == 3) {
                Thu = countBook(Thu, warehouse, bookVO);
            } else if (day == 4) {
                Web = countBook(Web, warehouse, bookVO);
            }else if (day == 5) {
                Tu = countBook(Tu, warehouse, bookVO);
            }else if (day == 6) {
                Fri = countBook(Fri, warehouse, bookVO);
            }else if (day == 7) {
                Sta = countBook(Sta, warehouse, bookVO);
            }
        }
        weekBooks.add(Sun);
        weekBooks.add(Mon);
        weekBooks.add(Thu);
        weekBooks.add(Web);
        weekBooks.add(Tu);
        weekBooks.add(Fri);
        weekBooks.add(Sta);
        //记录每周的图书入库数据
        List<CountBook> monthBooks = new ArrayList<CountBook>();
        CountBook firstWeek = new CountBook();
        CountBook secondWeek = new CountBook();
        CountBook thridWeek = new CountBook();
        CountBook fourthWeek = new CountBook();
        //处理月数据
        for (Warehouse warehouse : warehouses) {
            Book bookVO = bookService.getBookById(warehouse.getBookId());
            //判断是本出库时间是本月的第几周
            calendar.setTime(warehouse.getTime());
            week=calendar.get(Calendar.WEEK_OF_MONTH);
            if (week == 1) {
                firstWeek = countBook(firstWeek, warehouse, bookVO);
            } else if (week == 2) {
                secondWeek = countBook(secondWeek, warehouse, bookVO);
            } else if (week == 3) {
                thridWeek = countBook(thridWeek, warehouse, bookVO);
            } else {
                fourthWeek = countBook(fourthWeek, warehouse, bookVO);
            }
        }
        monthBooks.add(firstWeek);
        monthBooks.add(secondWeek);
        monthBooks.add(thridWeek);
        monthBooks.add(fourthWeek);
        model.addAttribute("countBooks", monthBooks);
        model.addAttribute("weekBooks",weekBooks);

        return "echarts_putInBook";

    }

    //ajax年统计入库图书
    @ResponseBody
    @GetMapping("/echartsPutBookByType")
    public List<CountBook> echartsPutBookByType(Model model,@RequestParam(value = "type",defaultValue = "0") int type) {
        List<CountBook> countBooks = new ArrayList<>();
        Calendar date = Calendar.getInstance();
        //type==0 本月 1 上月 2 今年 3 去年 4:本周 5：上周
        int year = 0;
        int month =0;
        int weekData=0;
        //本月
        //0表示1月份，所以+1，表示当前第几月
        if(type==0){
            year=Integer.valueOf(date.get(Calendar.YEAR));
            month = Integer.valueOf(date.get(Calendar.MONTH))+1;
        }
        //上个月
        if(type==1){
            year=Integer.valueOf(date.get(Calendar.YEAR));
            month=Integer.valueOf(date.get(Calendar.MONTH));
        }
        //今年
        if(type==2){
            year=Integer.valueOf(date.get(Calendar.YEAR));
        }
        //去年
        if(type==3){
            year=Integer.valueOf(date.get(Calendar.YEAR))-1;
        }
        //本周
        if(type==4){
            year=Integer.valueOf(date.get(Calendar.YEAR));
            month = Integer.valueOf(date.get(Calendar.MONTH))+1;
            weekData=Integer.valueOf(date.get(Calendar.WEEK_OF_MONTH));
        }
        //上周
        if(type==5){
            year=Integer.valueOf(date.get(Calendar.YEAR));
            month = Integer.valueOf(date.get(Calendar.MONTH))+1;
            weekData=Integer.valueOf(date.get(Calendar.WEEK_OF_MONTH))-1;
        }
        //得到请求时段的出库数据
        List<Warehouse> warehouses = warehouseService.listOutBook(year,month);
        //记录每周的图书出库数据

        /**
         * 处理周数据
         */
        if(type==4||type==5){
            List<Warehouse> weeks=warehouseService.listOutBook(year,month,weekData);
            CountBook Sun = new CountBook();
            CountBook Mon = new CountBook();
            CountBook Thu = new CountBook();
            CountBook Web = new CountBook();
            CountBook Tu = new CountBook();
            CountBook Fri = new CountBook();
            CountBook Sta = new CountBook();
            //处理周数据
            for (Warehouse warehouse : weeks) {
                Book bookVO = bookService.getBookById(warehouse.getBookId());
                date.setTime(warehouse.getTime());
                //判断出库时间是本周的周几，1是周日 7是周六
                int day;
                day=date.get(Calendar.DAY_OF_WEEK);
                if (day == 1) {
                    Sun = countBook(Sun, warehouse, bookVO);
                } else if (day == 2) {
                    Mon = countBook(Mon, warehouse, bookVO);
                } else if (day == 3) {
                    Thu = countBook(Thu, warehouse, bookVO);
                } else if (day == 4) {
                    Web = countBook(Web, warehouse, bookVO);
                }else if (day == 5) {
                    Tu = countBook(Tu, warehouse, bookVO);
                }else if (day == 6) {
                    Fri = countBook(Fri, warehouse, bookVO);
                }else if (day == 7) {
                    Sta = countBook(Sta, warehouse, bookVO);
                }
            }
            countBooks.add(Sun);
            countBooks.add(Mon);
            countBooks.add(Thu);
            countBooks.add(Web);
            countBooks.add(Tu);
            countBooks.add(Fri);
            countBooks.add(Sta);
        }
        /**
         * 处理月数据
         */
        if(type==0||type==1) {
            CountBook firstWeek = new CountBook();
            CountBook secondWeek = new CountBook();
            CountBook thridWeek = new CountBook();
            CountBook fourthWeek = new CountBook();
            for (Warehouse warehouse : warehouses) {
                Book bookVO = bookService.getBookById(warehouse.getBookId());
                Calendar calendar = Calendar.getInstance();
                //是本月，判断是本月的第几周
                calendar.setTime(warehouse.getTime());
                int week = calendar.get(Calendar.WEEK_OF_MONTH);
                if (week == 1) {
                    firstWeek = countBook(firstWeek, warehouse, bookVO);
                } else if (week == 2) {
                    secondWeek = countBook(secondWeek, warehouse, bookVO);
                } else if (week == 3) {
                    thridWeek = countBook(thridWeek, warehouse, bookVO);
                } else {
                    fourthWeek = countBook(fourthWeek, warehouse, bookVO);
                }
            }
            countBooks.add(firstWeek);
            countBooks.add(secondWeek);
            countBooks.add(thridWeek);
            countBooks.add(fourthWeek);
        }
        /**
         * 处理年数据
         */
        if(type==2||type==3) {
            CountBook first = new CountBook();
            CountBook second = new CountBook();
            CountBook thrid = new CountBook();
            CountBook fourth = new CountBook();
            for (Warehouse warehouse : warehouses) {
                Book bookVO = bookService.getBookById(warehouse.getBookId());
//                Calendar calendar = Calendar.getInstance();
//                //是本月，判断是本月的第几周
//                int week = calendar.get(Calendar.WEEK_OF_MONTH);
                int monthYear=warehouse.getMonth();
                if (monthYear >= 1&&monthYear<=3) {
                    first = countBook(first, warehouse, bookVO);
                } else if (monthYear >= 4&&monthYear<=6) {
                    second = countBook(second, warehouse, bookVO);
                } else if (monthYear >= 7&&monthYear<=9) {
                    thrid = countBook(thrid, warehouse, bookVO);
                } else {
                    fourth = countBook(fourth, warehouse, bookVO);
                }
            }
            countBooks.add(first);
            countBooks.add(second);
            countBooks.add(thrid);
            countBooks.add(fourth);
        }
        return countBooks;
    }
    /**
     *  出库图书页面跳转，初始化页面数据
     */
    @GetMapping("echartsOutBook")
    public String echartsOutBook(Model model,HttpSession session,@RequestParam(value = "type",defaultValue = "0") int type) {
        //获取所有图书出库数据
        List<Warehouse> warehousAll=warehouseService.listBook();
        CountBook countBook=new CountBook();
        for(Warehouse warehouse:warehousAll){
            Book bookVO = bookService.getBookById(warehouse.getBookId());
            countBook=countBook(countBook, warehouse, bookVO);
        }
        session.setAttribute("countAll",countBook);
        Calendar date = Calendar.getInstance();
        int month = Integer.valueOf(date.get(Calendar.MONTH))+1;
        //获取本月数据
        List<Warehouse> warehouses = warehouseService.listOutBook(0,month);
        Calendar calendar = Calendar.getInstance();
        int week=0;
        //判断今天是第几周
        week=calendar.get(Calendar.WEEK_OF_MONTH);
        //获取本周的数据
        int year=Integer.valueOf(date.get(Calendar.YEAR));
        List<Warehouse> weeks=warehouseService.listOutBook(year,month,week);
        List<CountBook> weekBooks = new ArrayList<CountBook>();
        CountBook Sun = new CountBook();
        CountBook Mon = new CountBook();
        CountBook Thu = new CountBook();
        CountBook Web = new CountBook();
        CountBook Tu = new CountBook();
        CountBook Fri = new CountBook();
        CountBook Sta = new CountBook();
        //处理周数据
        for (Warehouse warehouse : warehouses) {
            Book bookVO = bookService.getBookById(warehouse.getBookId());
            calendar.setTime(warehouse.getTime());
            //判断出库时间是本周的周几，1是周日 7是周六
            int day;
            day=calendar.get(Calendar.DAY_OF_WEEK);
            if (day == 1) {
                Sun = countBook(Sun, warehouse, bookVO);
            } else if (day == 2) {
                Mon = countBook(Mon, warehouse, bookVO);
            } else if (day == 3) {
                Thu = countBook(Thu, warehouse, bookVO);
            } else if (day == 4) {
                Web = countBook(Web, warehouse, bookVO);
            }else if (day == 5) {
                Tu = countBook(Tu, warehouse, bookVO);
            }else if (day == 6) {
                Fri = countBook(Fri, warehouse, bookVO);
            }else if (day == 7) {
                Sta = countBook(Sta, warehouse, bookVO);
            }
        }
        weekBooks.add(Sun);
        weekBooks.add(Mon);
        weekBooks.add(Thu);
        weekBooks.add(Web);
        weekBooks.add(Tu);
        weekBooks.add(Fri);
        weekBooks.add(Sta);
        //记录每周的图书出库数据
            List<CountBook> monthBooks = new ArrayList<CountBook>();
            CountBook firstWeek = new CountBook();
            CountBook secondWeek = new CountBook();
            CountBook thridWeek = new CountBook();
            CountBook fourthWeek = new CountBook();
        //处理月数据
            for (Warehouse warehouse : warehouses) {
                Book bookVO = bookService.getBookById(warehouse.getBookId());
                //判断是本出库时间是本月的第几周
                calendar.setTime(warehouse.getTime());
                week=calendar.get(Calendar.WEEK_OF_MONTH);
                if (week == 1) {
                    firstWeek = countBook(firstWeek, warehouse, bookVO);
                } else if (week == 2) {
                    secondWeek = countBook(secondWeek, warehouse, bookVO);
                } else if (week == 3) {
                    thridWeek = countBook(thridWeek, warehouse, bookVO);
                } else {
                    fourthWeek = countBook(fourthWeek, warehouse, bookVO);
                }
            }
        monthBooks.add(firstWeek);
        monthBooks.add(secondWeek);
        monthBooks.add(thridWeek);
        monthBooks.add(fourthWeek);
        model.addAttribute("countBooks", monthBooks);
        model.addAttribute("weekBooks",weekBooks);

        return "echarts_outBook";

    }

    //ajax年统计出库图书
    @ResponseBody
    @GetMapping("/echartsOutBookByType")
    public List<CountBook> echartsOutBookByType(Model model,@RequestParam(value = "type",defaultValue = "0") int type) {
        List<CountBook> countBooks = new ArrayList<>();
        Calendar date = Calendar.getInstance();
        //type==0 本月 1 上月 2 今年 3 去年 4:本周 5：上周
        int year = 0;
        int month =0;
        int weekData=0;
        //本月
        //0表示1月份，所以+1，表示当前第几月
        if(type==0){
            year=Integer.valueOf(date.get(Calendar.YEAR));
            month = Integer.valueOf(date.get(Calendar.MONTH))+1;
        }
        //上个月
        if(type==1){
            year=Integer.valueOf(date.get(Calendar.YEAR));
            month=Integer.valueOf(date.get(Calendar.MONTH));
        }
        //今年
        if(type==2){
            year=Integer.valueOf(date.get(Calendar.YEAR));
        }
        //去年
        if(type==3){
            year=Integer.valueOf(date.get(Calendar.YEAR))-1;
        }
        //本周
        if(type==4){
            year=Integer.valueOf(date.get(Calendar.YEAR));
            month = Integer.valueOf(date.get(Calendar.MONTH))+1;
            weekData=Integer.valueOf(date.get(Calendar.WEEK_OF_MONTH));
        }
        //上周
        if(type==5){
            year=Integer.valueOf(date.get(Calendar.YEAR));
            month = Integer.valueOf(date.get(Calendar.MONTH))+1;
            weekData=Integer.valueOf(date.get(Calendar.WEEK_OF_MONTH))-1;
        }
        //得到请求时段的出库数据
        List<Warehouse> warehouses = warehouseService.listOutBook(year,month);
        //记录每周的图书出库数据

        /**
         * 处理周数据
         */
        if(type==4||type==5){
            List<Warehouse> weeks=warehouseService.listOutBook(year,month,weekData);
            CountBook Sun = new CountBook();
            CountBook Mon = new CountBook();
            CountBook Thu = new CountBook();
            CountBook Web = new CountBook();
            CountBook Tu = new CountBook();
            CountBook Fri = new CountBook();
            CountBook Sta = new CountBook();
            //处理周数据
            for (Warehouse warehouse : weeks) {
                Book bookVO = bookService.getBookById(warehouse.getBookId());
                date.setTime(warehouse.getTime());
                //判断出库时间是本周的周几，1是周日 7是周六
                int day;
                day=date.get(Calendar.DAY_OF_WEEK);
                if (day == 1) {
                    Sun = countBook(Sun, warehouse, bookVO);
                } else if (day == 2) {
                    Mon = countBook(Mon, warehouse, bookVO);
                } else if (day == 3) {
                    Thu = countBook(Thu, warehouse, bookVO);
                } else if (day == 4) {
                    Web = countBook(Web, warehouse, bookVO);
                }else if (day == 5) {
                    Tu = countBook(Tu, warehouse, bookVO);
                }else if (day == 6) {
                    Fri = countBook(Fri, warehouse, bookVO);
                }else if (day == 7) {
                    Sta = countBook(Sta, warehouse, bookVO);
                }
            }
            countBooks.add(Sun);
            countBooks.add(Mon);
            countBooks.add(Thu);
            countBooks.add(Web);
            countBooks.add(Tu);
            countBooks.add(Fri);
            countBooks.add(Sta);
        }
        /**
         * 处理月数据
         */
        if(type==0||type==1) {
            CountBook firstWeek = new CountBook();
            CountBook secondWeek = new CountBook();
            CountBook thridWeek = new CountBook();
            CountBook fourthWeek = new CountBook();
            for (Warehouse warehouse : warehouses) {
                Book bookVO = bookService.getBookById(warehouse.getBookId());
                Calendar calendar = Calendar.getInstance();
                //是本月，判断是本月的第几周
                calendar.setTime(warehouse.getTime());
                int week = calendar.get(Calendar.WEEK_OF_MONTH);
                if (week == 1) {
                    firstWeek = countBook(firstWeek, warehouse, bookVO);
                } else if (week == 2) {
                    secondWeek = countBook(secondWeek, warehouse, bookVO);
                } else if (week == 3) {
                    thridWeek = countBook(thridWeek, warehouse, bookVO);
                } else {
                    fourthWeek = countBook(fourthWeek, warehouse, bookVO);
                }
            }
            countBooks.add(firstWeek);
            countBooks.add(secondWeek);
            countBooks.add(thridWeek);
            countBooks.add(fourthWeek);
        }
        /**
         * 处理年数据
         */
        if(type==2||type==3) {
            CountBook first = new CountBook();
            CountBook second = new CountBook();
            CountBook thrid = new CountBook();
            CountBook fourth = new CountBook();
            for (Warehouse warehouse : warehouses) {
                Book bookVO = bookService.getBookById(warehouse.getBookId());
//                Calendar calendar = Calendar.getInstance();
//                //是本月，判断是本月的第几周
//                int week = calendar.get(Calendar.WEEK_OF_MONTH);
                int monthYear=warehouse.getMonth();
                if (monthYear >= 1&&monthYear<=3) {
                    first = countBook(first, warehouse, bookVO);
                } else if (monthYear >= 4&&monthYear<=6) {
                    second = countBook(second, warehouse, bookVO);
                } else if (monthYear >= 7&&monthYear<=9) {
                    thrid = countBook(thrid, warehouse, bookVO);
                } else {
                    fourth = countBook(fourth, warehouse, bookVO);
                }
            }
            countBooks.add(first);
            countBooks.add(second);
            countBooks.add(thrid);
            countBooks.add(fourth);
        }
        return countBooks;
    }

    //统计图书销售
    @RequestMapping("/echartsMarket")
    public String echartsMarket(Model model) {
        //月销售数据
        //literature/novel/economicManagement/life/exam
        model.addAttribute("childCount",100);
        model.addAttribute("literatureCount",200);
        model.addAttribute("novelCount",189);
        model.addAttribute("economicManagementCount",123);
        model.addAttribute("lifeCount",12);
        model.addAttribute("examCount",144);
        //初始化销售图
        List<Book> books=bookService.listBooks("");
        CountBook marketBook = new CountBook();
        for (Book book:books){
            marketBook=marketBook(marketBook,book);
        }
        model.addAttribute("marketCount",marketBook);
        System.out.println(marketBook);
        return "echarts_market";
    }


    @RequestMapping("/getBookById")
    public ModelAndView getBookById(Long id, ModelAndView modelAndView) {

        BookVO bookVO = bookService.getBookForProtal(id);
        List<Book> bookKinds = bookService.getBookByKinds(bookVO.getKinds());
        modelAndView.setViewName("protal_detail");
        modelAndView.addObject("bookVO", bookVO);
        modelAndView.addObject("bookKinds", bookKinds);
        System.out.println(bookKinds);
        return modelAndView;
    }

    //封装当前图书类型查询统计
    public CountBook countBook(CountBook countBook, Warehouse warehouse, Book bookVO) {
        if (19 <= bookVO.getCategoryId() && bookVO.getCategoryId() <= 22) {
            countBook.setChild((countBook.getChild() + warehouse.getBookNumber().intValue()));
        }
        if (23 <= bookVO.getCategoryId() && bookVO.getCategoryId() <= 25) {
            countBook.setLiterature((countBook.getLiterature() + warehouse.getBookNumber().intValue()));
        }
        if (26 <= bookVO.getCategoryId() && bookVO.getCategoryId() <= 28) {
            countBook.setNovel((countBook.getNovel() + warehouse.getBookNumber().intValue()));
        }
        if (29 <= bookVO.getCategoryId() && bookVO.getCategoryId() <= 32) {
            countBook.setEconomicManagement((countBook.getEconomicManagement() + warehouse.getBookNumber().intValue()));
        }
        if (33 <= bookVO.getCategoryId() && bookVO.getCategoryId() <= 36) {
            countBook.setLife((countBook.getLife() + warehouse.getBookNumber().intValue()));
        }
        if (37 <= bookVO.getCategoryId() && bookVO.getCategoryId() <= 39) {
            countBook.setExam((countBook.getExam() + warehouse.getBookNumber().intValue()));
        }
        return countBook;
    }
    //封装当前图书类型查询统计
    public CountBook marketBook(CountBook countBook, Book book) {
        if (19 <= book.getCategoryId() && book.getCategoryId() <= 22) {
            countBook.setChild(countBook.getChild() + book.getSalesVolume());
        }
        if (23 <= book.getCategoryId() && book.getCategoryId() <= 25) {
            countBook.setLiterature(countBook.getLiterature() + book.getSalesVolume());
        }
        if (26 <= book.getCategoryId() && book.getCategoryId() <= 28) {
            countBook.setNovel(countBook.getNovel() + book.getSalesVolume());
        }
        if (29 <= book.getCategoryId() && book.getCategoryId() <= 32) {
            countBook.setEconomicManagement(countBook.getEconomicManagement() + book.getSalesVolume());
        }
        if (33 <= book.getCategoryId() && book.getCategoryId() <= 36) {
            countBook.setLife(countBook.getLife() + book.getSalesVolume());
        }
        if (37 <= book.getCategoryId() && book.getCategoryId() <= 39) {
            countBook.setExam(countBook.getExam() + book.getSalesVolume());
        }
        return countBook;
    }
}
