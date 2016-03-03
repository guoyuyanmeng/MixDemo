//
//  APIConst.h
//  demos
//
//  Created by kang on 16/1/26.
//  Copyright © 2016年 kang. All rights reserved.
//

#ifndef APIConstant_h
#define APIConstant_h


#endif /* APIConst_h */

//服务器地址
//#define ADDRESS_IP   @"http://phr.cmri.cn/datav4"//公网测试
//#define ADDRESS_IP @"http://223.202.47.136/datav4"
//#define ADDRESS_IP @"http://223.202.47.151/iShangHealth"//正式
#define ADDRESS_IP @"http://happiness.mhealth.cmri.cn/iShangHealth/"//正式
//#define ADDRESS_IP @"http://10.2.57.5/iShangHealth"//内网测试

//tabbarView  高度
#define TOOL_BAR_H 316

//接口
#define LoadJson             @""ADDRESS_IP"/patientTask/queryPatientDayTaskRecordByTaskid.do?"//直接根据id从后台获取数据
#define AddFriendURL         @""ADDRESS_IP"/friends.do?myAction=addFriend"
#define InsertPatientTaskURL @""ADDRESS_IP"/patientTask/insertPatientTaskRecord.do"
#define UpdatePatientTaskURL @""ADDRESS_IP"/patientTask/updatePatientTaskRecord.do"
#define UploadPatientTaskURL @""ADDRESS_IP"/patientTask/uploadTaskData.do"
#define SEARCH_FRIEND_URL    @""ADDRESS_IP"/patient/queryPatientInfoByUserphone.do"
#define AVRTAR_URL           @""ADDRESS_IP"/userimg/"
#define RECORD_WEB_URL       @""ADDRESS_IP"/client.do?action=record"
#define ADD_REMIND_URL       @""ADDRESS_IP"/client.do?action=medicine"
#define ALERT_UPLOAD_URL     @""ADDRESS_IP"/client.do?action=uploadData"
#define UPLOAD_USER_PIC_URL  @""ADDRESS_IP"/patient/uploadPatientPic.do"
#define LOGIN_URL            @""ADDRESS_IP"/patient/patientLogin.do?"
#define VERIFICATION_URL     @""ADDRESS_IP"/patient/sendTempCode.do?"
#define RESET_PASSWORD_URL   @""ADDRESS_IP"/patient/passwordreset.do?"
#define CHANGE_PASSWORD_URL  @""ADDRESS_IP"/patient/passwordchange.do?"

#define FRIEND_SHARE         @""ADDRESS_IP"/client.do?action=friendShare"
#define FRIEND_LIST_URL      @""ADDRESS_IP"/client.do?action=friendList"
//#define MESSAGE_URL          @""ADDRESS_IP"/client.do?action=message"//旧消息地址
#define MESSAGE_URL          @""ADDRESS_IP"/client.do?action=unreadMessages"//新消息地址
#define REGISTER_URL         @""ADDRESS_IP"/client.do?action=register"
#define SCHEDULE_URL         @""ADDRESS_IP"/client.do?action=schedule"
#define SWITCH_URL           @""ADDRESS_IP"/client.do?action=user"
#define REMIND_WEB_URL       @""ADDRESS_IP"/client.do?action=remind"
#define TREND_WEB_URL        @""ADDRESS_IP"/client.do?action=trend"
#define PHYSICAL_WEB_URL     @""ADDRESS_IP"/client.do?action=physicalDetails"
#define TIME_WEB_URL         @""ADDRESS_IP"/client.do?action=queryTaskRecords"
#define GET_USER_CLOCK_URL   @""ADDRESS_IP"/patientTask/queryPatientTaskPeriod.do"
#define WEB_URL              @""ADDRESS_IP"/client.do?action="
#define CHECK_VESION_URL     @"http://itunes.apple.com/cn/lookup?id=881324559"
#define APP_UPDATE_URL       @"https://itunes.apple.com/cn/app/id881324559"
//#define CHECK_OUT_PLIST      @"http://mhealth.cmri.cn/app/app/ishealth.plist"//从本地服务器检查版本数据
#define CHECK_OUT_PLIST      @"https://dn-ishanghealth.qbox.me/ishealth.plist"//从7牛服务器上检查版本数据
#define NEW_VERSION_URL      @"http://mhealth.cmri.cn/app/health.do"//新版本地址

//#define IMAGE_FIEL_URL         @"http://223.202.47.151/iShangHealth/DietImages/"// imageFeilUrl
#define IMAGE_FIEL_URL       @""ADDRESS_IP"/DietImages/"// imageFeilUrl

// RANK YF
#define RANK_SERVER_URL      @"http://mhealth.cmri.cn/iactivity/openClientApi.do?action="
#define AVATAR_URL           @"http://mhealth.cmri.cn/iactivity/UserAvatar/"


//相对iphone6 屏幕比
#define KWidth_Scale    [UIScreen mainScreen].bounds.size.width/375.0f
#define TabBar_T_Color RGB(244, 89, 27)

//RGB
#define RGBA(r, g, b, a)    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)     RGBA(r, g, b, 1.0f)

//系统版本
#define SYSTEM_VERSION   [[UIDevice currentDevice].systemVersion floatValue]

//设备物理尺寸
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height