import 'package:mehna_tech/home/domain/entities/category.dart';
import 'package:mehna_tech/home/domain/entities/post.dart';
import 'package:mehna_tech/home/domain/entities/promote_posts.dart';
import 'package:mehna_tech/search/domain/entities/Search.dart';
import 'package:mehna_tech/workshop_profile/domain/entities/WorkshopProfile.dart';

List<PromotePosts> advertisementList =const [
  PromotePosts(id: 22, image: "https://kheidma.com/wp-content/uploads/2021/10/%D8%B4%D8%B1%D9%83%D8%A9-%D8%AA%D8%B1%D9%83%D9%8A%D8%A8-%D9%85%D9%83%D9%8A%D9%81%D8%A7%D8%AA-%D8%B3%D8%A8%D9%84%D9%8A%D8%AA-%D8%A8%D9%85%D9%83%D8%A9-%D8%B5%D9%8A%D8%A7%D9%86%D8%A9-%D9%85%D9%83%D9%8A%D9%81%D8%A7%D8%AA-%D8%A8%D9%85%D9%83%D8%A9.jpg"),
  PromotePosts(id: 33, image: "https://www.emaar-pal.org/wp-content/uploads/2021/09/2.png"),
  PromotePosts(id: 22, image: "https://www.tem-servic.com/wp-content/uploads/2022/04/%D8%B4%D8%B1%D9%83%D8%A9-%D8%B5%D9%8A%D8%A7%D9%86%D8%A9-%D9%83%D9%87%D8%B1%D8%A8%D8%A7%D8%A1-%D8%A8%D8%A7%D9%84%D8%B1%D9%8A%D8%A7%D8%B6.jpg"),
  PromotePosts(id: 42234, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQb3mS2n2SAvsiNXHEWjRTJ3kDlA2dS1fbhw&usqp=CAU"),
  PromotePosts(id: 223, image: "https://www.jawhara-ae.net/wp-content/uploads/2022/05/p.jpg")
];

List<Post> postsList =const [
  Post(
      id: 455,
      userName: 'السلام الحديثة',
      text: ' اليوم كنا بمزرعة السيد مؤيد نوفل وركبناله طاقة شمسية سعتها 2000 كيلو واط واتكلل شغلنا بالنجاح الحمدلله منحب نبارك للسيد مؤيد نوفل عالطاقة ',
      postImages: [
        "https://www.aljazeera.net/wp-content/uploads/2023/06/shutterstock_72500704-1686487965.jpg?resize=1800%2C1800",
        "https://www.almrsal.com/wp-content/uploads/2022/03/%D9%83%D9%85-%D9%8A%D8%AD%D8%AA%D8%A7%D8%AC-%D8%A7%D9%84%D9%85%D9%86%D8%B2%D9%84-%D9%85%D9%86-%D8%A7%D9%84%D8%B7%D8%A7%D9%82%D8%A9-%D8%A7%D9%84%D8%B4%D9%85%D8%B3%D9%8A%D8%A9-%D8%9F..-%D9%88%D8%B9%D8%AF%D8%AF-%D8%A7%D9%84%D8%A3%D9%84%D9%88%D8%A7%D8%AD.jpg",
        "https://cdn101.adwimg.com/crp/107,-4,469,305,217,300/220123/classifieds/7iKSsNXmbRbzBZE4PqXNgpeDx6p40Q6M.png",
        "https://media.gemini.media/img/large/2017/10/7/2017_10_7_16_11_52_295.jpg"
      ],
      userImage: "https://syaaraat.com/public/storage/members/accounts/dealer/LDIwlDqcrl5xIeXD3dRcyN0fp5PYr01wbTXnnzdc.jpg",
      likesCount: 341,
      videoPath: 'csw',
      isVideo: false
  ),
  Post(
      id: 455,
      userName: "شركة صقر الامارت",
      text: 'لدينا احدث انابيب الصرف الصحي والتمديد مع خيرة معلمين التمديد وباسعار منافسة فقط اطلبنا وبيتك بأمانتنا',
      postImages: [
        "https://www.saqr-ae.com/wp-content/uploads/2022/03/%D8%B3%D8%A8%D8%A7%D9%83-%D9%81%D9%8A-%D8%B9%D8%AC%D9%85%D8%A7%D9%86.png",
        "https://i.ytimg.com/vi/np_VBdfY1CA/maxresdefault.jpg",
        "https://archarmony.com/wp-content/uploads/2020/01/Plambaing-work-15.jpg",
        "https://www.saqr-ae.com/wp-content/uploads/2022/03/%D8%B3%D8%A8%D8%A7%D9%83-%D9%81%D9%8A-%D8%B9%D8%AC%D9%85%D8%A7%D9%863.png"
      ],
      userImage: "https://sazmoversuae.com/ar/images/logo.jpg",
      likesCount: 220,
      videoPath: 'csw',
      isVideo: false
  ),
  Post(
      id: 455,
      userName: 'السلام الحديثة',
      text: ' اليوم كنا بمزرعة السيد مؤيد نوفل وركبناله طاقة شمسية سعتها 2000 كيلو واط واتكلل شغلنا بالنجاح الحمدلله منحب نبارك للسيد مؤيد نوفل عالطاقة ',
      postImages: [
        "https://www.almrsal.com/wp-content/uploads/2022/03/%D9%83%D9%85-%D9%8A%D8%AD%D8%AA%D8%A7%D8%AC-%D8%A7%D9%84%D9%85%D9%86%D8%B2%D9%84-%D9%85%D9%86-%D8%A7%D9%84%D8%B7%D8%A7%D9%82%D8%A9-%D8%A7%D9%84%D8%B4%D9%85%D8%B3%D9%8A%D8%A9-%D8%9F..-%D9%88%D8%B9%D8%AF%D8%AF-%D8%A7%D9%84%D8%A3%D9%84%D9%88%D8%A7%D8%AD.jpg",
        "https://www.aljazeera.net/wp-content/uploads/2023/06/shutterstock_72500704-1686487965.jpg?resize=1800%2C1800",
        "https://cdn101.adwimg.com/crp/107,-4,469,305,217,300/220123/classifieds/7iKSsNXmbRbzBZE4PqXNgpeDx6p40Q6M.png",
        "https://media.gemini.media/img/large/2017/10/7/2017_10_7_16_11_52_295.jpg"
      ],
      userImage: "https://syaaraat.com/public/storage/members/accounts/dealer/LDIwlDqcrl5xIeXD3dRcyN0fp5PYr01wbTXnnzdc.jpg",
      likesCount: 341,
      videoPath: 'csw',
      isVideo: false
  ),
  Post(
      id: 455,
      userName: "شركة صقر الامارت",
      text: 'لدينا احدث انابيب الصرف الصحي والتمديد مع خيرة معلمين التمديد وباسعار منافسة فقط اطلبنا وبيتك بأمانتنا',
      postImages: [
        "https://archarmony.com/wp-content/uploads/2020/01/Plambaing-work-15.jpg",
        "https://www.saqr-ae.com/wp-content/uploads/2022/03/%D8%B3%D8%A8%D8%A7%D9%83-%D9%81%D9%8A-%D8%B9%D8%AC%D9%85%D8%A7%D9%86.png",
        "https://i.ytimg.com/vi/np_VBdfY1CA/maxresdefault.jpg",
        "https://www.saqr-ae.com/wp-content/uploads/2022/03/%D8%B3%D8%A8%D8%A7%D9%83-%D9%81%D9%8A-%D8%B9%D8%AC%D9%85%D8%A7%D9%863.png"
      ],
      userImage: "https://sazmoversuae.com/ar/images/logo.jpg",
      likesCount: 220,
      videoPath: 'csw',
      isVideo: false
  ),
  Post(
      id: 455,
      userName: 'السلام الحديثة',
      text: ' اليوم كنا بمزرعة السيد مؤيد نوفل وركبناله طاقة شمسية سعتها 2000 كيلو واط واتكلل شغلنا بالنجاح الحمدلله منحب نبارك للسيد مؤيد نوفل عالطاقة ',
      postImages: [
        "https://media.gemini.media/img/large/2017/10/7/2017_10_7_16_11_52_295.jpg",
        "https://www.aljazeera.net/wp-content/uploads/2023/06/shutterstock_72500704-1686487965.jpg?resize=1800%2C1800",
        "https://www.almrsal.com/wp-content/uploads/2022/03/%D9%83%D9%85-%D9%8A%D8%AD%D8%AA%D8%A7%D8%AC-%D8%A7%D9%84%D9%85%D9%86%D8%B2%D9%84-%D9%85%D9%86-%D8%A7%D9%84%D8%B7%D8%A7%D9%82%D8%A9-%D8%A7%D9%84%D8%B4%D9%85%D8%B3%D9%8A%D8%A9-%D8%9F..-%D9%88%D8%B9%D8%AF%D8%AF-%D8%A7%D9%84%D8%A3%D9%84%D9%88%D8%A7%D8%AD.jpg",
        "https://cdn101.adwimg.com/crp/107,-4,469,305,217,300/220123/classifieds/7iKSsNXmbRbzBZE4PqXNgpeDx6p40Q6M.png",
      ],
      userImage: "https://syaaraat.com/public/storage/members/accounts/dealer/LDIwlDqcrl5xIeXD3dRcyN0fp5PYr01wbTXnnzdc.jpg",
      likesCount: 341,
      videoPath: 'csw',
      isVideo: false
  ),
  Post(
      id: 455,
      userName: 'السلام الحديثة',
      text: ' اليوم كنا بمزرعة السيد مؤيد نوفل وركبناله طاقة شمسية سعتها 2000 كيلو واط واتكلل شغلنا بالنجاح الحمدلله منحب نبارك للسيد مؤيد نوفل عالطاقة ',
      postImages: [
        "https://www.aljazeera.net/wp-content/uploads/2023/06/shutterstock_72500704-1686487965.jpg?resize=1800%2C1800",
        "https://www.almrsal.com/wp-content/uploads/2022/03/%D9%83%D9%85-%D9%8A%D8%AD%D8%AA%D8%A7%D8%AC-%D8%A7%D9%84%D9%85%D9%86%D8%B2%D9%84-%D9%85%D9%86-%D8%A7%D9%84%D8%B7%D8%A7%D9%82%D8%A9-%D8%A7%D9%84%D8%B4%D9%85%D8%B3%D9%8A%D8%A9-%D8%9F..-%D9%88%D8%B9%D8%AF%D8%AF-%D8%A7%D9%84%D8%A3%D9%84%D9%88%D8%A7%D8%AD.jpg",
        "https://cdn101.adwimg.com/crp/107,-4,469,305,217,300/220123/classifieds/7iKSsNXmbRbzBZE4PqXNgpeDx6p40Q6M.png",
        "https://media.gemini.media/img/large/2017/10/7/2017_10_7_16_11_52_295.jpg"
      ],
      userImage: "https://syaaraat.com/public/storage/members/accounts/dealer/LDIwlDqcrl5xIeXD3dRcyN0fp5PYr01wbTXnnzdc.jpg",
      likesCount: 341,
      videoPath: 'csw',
      isVideo: false
  ),
  Post(
      id: 455,
      userName: "شركة صقر الامارت",
      text: 'لدينا احدث انابيب الصرف الصحي والتمديد مع خيرة معلمين التمديد وباسعار منافسة فقط اطلبنا وبيتك بأمانتنا',
      postImages: [
        "https://www.saqr-ae.com/wp-content/uploads/2022/03/%D8%B3%D8%A8%D8%A7%D9%83-%D9%81%D9%8A-%D8%B9%D8%AC%D9%85%D8%A7%D9%86.png",
        "https://i.ytimg.com/vi/np_VBdfY1CA/maxresdefault.jpg",
        "https://archarmony.com/wp-content/uploads/2020/01/Plambaing-work-15.jpg",
        "https://www.saqr-ae.com/wp-content/uploads/2022/03/%D8%B3%D8%A8%D8%A7%D9%83-%D9%81%D9%8A-%D8%B9%D8%AC%D9%85%D8%A7%D9%863.png"
      ],
      userImage: "https://sazmoversuae.com/ar/images/logo.jpg",
      likesCount: 220,
      videoPath: 'csw',
      isVideo: false
  ),
  Post(
      id: 455,
      userName: 'السلام الحديثة',
      text: ' اليوم كنا بمزرعة السيد مؤيد نوفل وركبناله طاقة شمسية سعتها 2000 كيلو واط واتكلل شغلنا بالنجاح الحمدلله منحب نبارك للسيد مؤيد نوفل عالطاقة ',
      postImages: [
        "https://www.almrsal.com/wp-content/uploads/2022/03/%D9%83%D9%85-%D9%8A%D8%AD%D8%AA%D8%A7%D8%AC-%D8%A7%D9%84%D9%85%D9%86%D8%B2%D9%84-%D9%85%D9%86-%D8%A7%D9%84%D8%B7%D8%A7%D9%82%D8%A9-%D8%A7%D9%84%D8%B4%D9%85%D8%B3%D9%8A%D8%A9-%D8%9F..-%D9%88%D8%B9%D8%AF%D8%AF-%D8%A7%D9%84%D8%A3%D9%84%D9%88%D8%A7%D8%AD.jpg",
        "https://www.aljazeera.net/wp-content/uploads/2023/06/shutterstock_72500704-1686487965.jpg?resize=1800%2C1800",
        "https://cdn101.adwimg.com/crp/107,-4,469,305,217,300/220123/classifieds/7iKSsNXmbRbzBZE4PqXNgpeDx6p40Q6M.png",
        "https://media.gemini.media/img/large/2017/10/7/2017_10_7_16_11_52_295.jpg"
      ],
      userImage: "https://syaaraat.com/public/storage/members/accounts/dealer/LDIwlDqcrl5xIeXD3dRcyN0fp5PYr01wbTXnnzdc.jpg",
      likesCount: 341,
      videoPath: 'csw',
      isVideo: false
  ),
  Post(
      id: 455,
      userName: "شركة صقر الامارت",
      text: 'لدينا احدث انابيب الصرف الصحي والتمديد مع خيرة معلمين التمديد وباسعار منافسة فقط اطلبنا وبيتك بأمانتنا',
      postImages: [
        "https://archarmony.com/wp-content/uploads/2020/01/Plambaing-work-15.jpg",
        "https://www.saqr-ae.com/wp-content/uploads/2022/03/%D8%B3%D8%A8%D8%A7%D9%83-%D9%81%D9%8A-%D8%B9%D8%AC%D9%85%D8%A7%D9%86.png",
        "https://i.ytimg.com/vi/np_VBdfY1CA/maxresdefault.jpg",
        "https://www.saqr-ae.com/wp-content/uploads/2022/03/%D8%B3%D8%A8%D8%A7%D9%83-%D9%81%D9%8A-%D8%B9%D8%AC%D9%85%D8%A7%D9%863.png"
      ],
      userImage: "https://sazmoversuae.com/ar/images/logo.jpg",
      likesCount: 220,
      videoPath: 'csw',
      isVideo: false
  ),
  Post(
      id: 455,
      userName: 'السلام الحديثة',
      text: ' اليوم كنا بمزرعة السيد مؤيد نوفل وركبناله طاقة شمسية سعتها 2000 كيلو واط واتكلل شغلنا بالنجاح الحمدلله منحب نبارك للسيد مؤيد نوفل عالطاقة ',
      postImages: [
        "https://media.gemini.media/img/large/2017/10/7/2017_10_7_16_11_52_295.jpg",
        "https://www.aljazeera.net/wp-content/uploads/2023/06/shutterstock_72500704-1686487965.jpg?resize=1800%2C1800",
        "https://www.almrsal.com/wp-content/uploads/2022/03/%D9%83%D9%85-%D9%8A%D8%AD%D8%AA%D8%A7%D8%AC-%D8%A7%D9%84%D9%85%D9%86%D8%B2%D9%84-%D9%85%D9%86-%D8%A7%D9%84%D8%B7%D8%A7%D9%82%D8%A9-%D8%A7%D9%84%D8%B4%D9%85%D8%B3%D9%8A%D8%A9-%D8%9F..-%D9%88%D8%B9%D8%AF%D8%AF-%D8%A7%D9%84%D8%A3%D9%84%D9%88%D8%A7%D8%AD.jpg",
        "https://cdn101.adwimg.com/crp/107,-4,469,305,217,300/220123/classifieds/7iKSsNXmbRbzBZE4PqXNgpeDx6p40Q6M.png",
      ],
      userImage: "https://syaaraat.com/public/storage/members/accounts/dealer/LDIwlDqcrl5xIeXD3dRcyN0fp5PYr01wbTXnnzdc.jpg",
      likesCount: 341,
      videoPath: 'csw',
      isVideo: false
  ),
  Post(
      id: 455,
      userName: 'السلام الحديثة',
      text: ' اليوم كنا بمزرعة السيد مؤيد نوفل وركبناله طاقة شمسية سعتها 2000 كيلو واط واتكلل شغلنا بالنجاح الحمدلله منحب نبارك للسيد مؤيد نوفل عالطاقة ',
      postImages: [
        "https://www.aljazeera.net/wp-content/uploads/2023/06/shutterstock_72500704-1686487965.jpg?resize=1800%2C1800",
        "https://www.almrsal.com/wp-content/uploads/2022/03/%D9%83%D9%85-%D9%8A%D8%AD%D8%AA%D8%A7%D8%AC-%D8%A7%D9%84%D9%85%D9%86%D8%B2%D9%84-%D9%85%D9%86-%D8%A7%D9%84%D8%B7%D8%A7%D9%82%D8%A9-%D8%A7%D9%84%D8%B4%D9%85%D8%B3%D9%8A%D8%A9-%D8%9F..-%D9%88%D8%B9%D8%AF%D8%AF-%D8%A7%D9%84%D8%A3%D9%84%D9%88%D8%A7%D8%AD.jpg",
        "https://cdn101.adwimg.com/crp/107,-4,469,305,217,300/220123/classifieds/7iKSsNXmbRbzBZE4PqXNgpeDx6p40Q6M.png",
        "https://media.gemini.media/img/large/2017/10/7/2017_10_7_16_11_52_295.jpg"
      ],
      userImage: "https://syaaraat.com/public/storage/members/accounts/dealer/LDIwlDqcrl5xIeXD3dRcyN0fp5PYr01wbTXnnzdc.jpg",
      likesCount: 341,
      videoPath: 'csw',
      isVideo: false
  ),
  Post(
      id: 455,
      userName: "شركة صقر الامارت",
      text: 'لدينا احدث انابيب الصرف الصحي والتمديد مع خيرة معلمين التمديد وباسعار منافسة فقط اطلبنا وبيتك بأمانتنا',
      postImages: [
        "https://www.saqr-ae.com/wp-content/uploads/2022/03/%D8%B3%D8%A8%D8%A7%D9%83-%D9%81%D9%8A-%D8%B9%D8%AC%D9%85%D8%A7%D9%86.png",
        "https://i.ytimg.com/vi/np_VBdfY1CA/maxresdefault.jpg",
        "https://archarmony.com/wp-content/uploads/2020/01/Plambaing-work-15.jpg",
        "https://www.saqr-ae.com/wp-content/uploads/2022/03/%D8%B3%D8%A8%D8%A7%D9%83-%D9%81%D9%8A-%D8%B9%D8%AC%D9%85%D8%A7%D9%863.png"
      ],
      userImage: "https://sazmoversuae.com/ar/images/logo.jpg",
      likesCount: 220,
      videoPath: 'csw',
      isVideo: false
  ),
  Post(
      id: 455,
      userName: 'السلام الحديثة',
      text: ' اليوم كنا بمزرعة السيد مؤيد نوفل وركبناله طاقة شمسية سعتها 2000 كيلو واط واتكلل شغلنا بالنجاح الحمدلله منحب نبارك للسيد مؤيد نوفل عالطاقة ',
      postImages: [
        "https://www.almrsal.com/wp-content/uploads/2022/03/%D9%83%D9%85-%D9%8A%D8%AD%D8%AA%D8%A7%D8%AC-%D8%A7%D9%84%D9%85%D9%86%D8%B2%D9%84-%D9%85%D9%86-%D8%A7%D9%84%D8%B7%D8%A7%D9%82%D8%A9-%D8%A7%D9%84%D8%B4%D9%85%D8%B3%D9%8A%D8%A9-%D8%9F..-%D9%88%D8%B9%D8%AF%D8%AF-%D8%A7%D9%84%D8%A3%D9%84%D9%88%D8%A7%D8%AD.jpg",
        "https://www.aljazeera.net/wp-content/uploads/2023/06/shutterstock_72500704-1686487965.jpg?resize=1800%2C1800",
        "https://cdn101.adwimg.com/crp/107,-4,469,305,217,300/220123/classifieds/7iKSsNXmbRbzBZE4PqXNgpeDx6p40Q6M.png",
        "https://media.gemini.media/img/large/2017/10/7/2017_10_7_16_11_52_295.jpg"
      ],
      userImage: "https://syaaraat.com/public/storage/members/accounts/dealer/LDIwlDqcrl5xIeXD3dRcyN0fp5PYr01wbTXnnzdc.jpg",
      likesCount: 341,
      videoPath: 'csw',
      isVideo: false
  ),
  Post(
      id: 455,
      userName: "شركة صقر الامارت",
      text: 'لدينا احدث انابيب الصرف الصحي والتمديد مع خيرة معلمين التمديد وباسعار منافسة فقط اطلبنا وبيتك بأمانتنا',
      postImages: [
        "https://archarmony.com/wp-content/uploads/2020/01/Plambaing-work-15.jpg",
        "https://www.saqr-ae.com/wp-content/uploads/2022/03/%D8%B3%D8%A8%D8%A7%D9%83-%D9%81%D9%8A-%D8%B9%D8%AC%D9%85%D8%A7%D9%86.png",
        "https://i.ytimg.com/vi/np_VBdfY1CA/maxresdefault.jpg",
        "https://www.saqr-ae.com/wp-content/uploads/2022/03/%D8%B3%D8%A8%D8%A7%D9%83-%D9%81%D9%8A-%D8%B9%D8%AC%D9%85%D8%A7%D9%863.png"
      ],
      userImage: "https://sazmoversuae.com/ar/images/logo.jpg",
      likesCount: 220,
      videoPath: 'csw',
      isVideo: false
  ),
  Post(
      id: 455,
      userName: 'السلام الحديثة',
      text: ' اليوم كنا بمزرعة السيد مؤيد نوفل وركبناله طاقة شمسية سعتها 2000 كيلو واط واتكلل شغلنا بالنجاح الحمدلله منحب نبارك للسيد مؤيد نوفل عالطاقة ',
      postImages: [
        "https://media.gemini.media/img/large/2017/10/7/2017_10_7_16_11_52_295.jpg",
        "https://www.aljazeera.net/wp-content/uploads/2023/06/shutterstock_72500704-1686487965.jpg?resize=1800%2C1800",
        "https://www.almrsal.com/wp-content/uploads/2022/03/%D9%83%D9%85-%D9%8A%D8%AD%D8%AA%D8%A7%D8%AC-%D8%A7%D9%84%D9%85%D9%86%D8%B2%D9%84-%D9%85%D9%86-%D8%A7%D9%84%D8%B7%D8%A7%D9%82%D8%A9-%D8%A7%D9%84%D8%B4%D9%85%D8%B3%D9%8A%D8%A9-%D8%9F..-%D9%88%D8%B9%D8%AF%D8%AF-%D8%A7%D9%84%D8%A3%D9%84%D9%88%D8%A7%D8%AD.jpg",
        "https://cdn101.adwimg.com/crp/107,-4,469,305,217,300/220123/classifieds/7iKSsNXmbRbzBZE4PqXNgpeDx6p40Q6M.png",
      ],
      userImage: "https://syaaraat.com/public/storage/members/accounts/dealer/LDIwlDqcrl5xIeXD3dRcyN0fp5PYr01wbTXnnzdc.jpg",
      likesCount: 341,
      videoPath: 'csw',
      isVideo: false
  ),
];

List<Categories> categoriesList = const[
  Categories(categoryId:0,name: "مكيفات", image: "https://www.alraid-sa.com/wp-content/uploads/2020/05/%D8%AA%D8%B1%D9%83%D9%8A%D8%A8-%D9%85%D9%83%D9%8A%D9%81%D8%A7%D8%AA-%D8%A8%D8%A7%D9%84%D8%B1%D9%8A%D8%A7%D8%B6.jpg.webp"),
  Categories(categoryId:1,name: "صحية", image: "https://3mlakclean.com/images/media/1653252571AC%20PLUMBING%20NEW%20LOGO%20SMALL%20GUY.jpg"),
  Categories(categoryId:2,name: "كهرباء", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ14rkNTNlNVVdZMrbVwX7CkgLncyjItmgu1FsqlkXpMykCLJxzjQajuCrKhXBikzzQaaI&usqp=CAU"),
  Categories(categoryId:3,name: "طاقات", image: "https://argaamplus.s3.amazonaws.com/55c03349-9c75-4145-9dc7-badc1dba396f.jpg"),
  Categories(categoryId:4,name: "برادات", image: "https://cdn-dpbok.nitrocdn.com/LjXEjxITjEoPdeZKMjBAwbjpRRLpIzmM/assets/images/optimized/rev-b84c9ac/refrigeratorrepairkuwait.com/wp-content/uploads/ezgif-3-2bc1c5723c2d.png"),
  Categories(categoryId:5,name: "ميكانيك", image: "https://mobawaba.ahram.org.eg/Media/Picture/2018/10/31/2018-636765838855875581-587.jpg"),
  Categories(categoryId:6,name: "تنظيف بيوت", image: "https://i.pinimg.com/736x/af/92/2a/af922a0c15b42456cce806e785fd6eef.jpg"),
  Categories(categoryId:7,name: "مهندس معماري", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB7ShUN4MlmSWzvrYkuLkgEMKbFVI4Tor_zA&usqp=CAU"),
  Categories(categoryId:8,name: "دهان", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSO_negDCyxCHUlpSi7IcKzFx0lBNprBT8T5jMbzzYly-fDNgZgazaLEA-9KCbrk4cfjU&usqp=CAU"),
  Categories(categoryId:9,name: "مصلح غازات", image: "https://content.joacademy.com/images/44_1657201885.jpg"),
  Categories(categoryId:10,name: "مولدات", image: "https://bsg-i.nbxc.com/product/d2/e2/15/cd67136f21c19cdaa0a9b45309.jpg@95Q.webp"),
  Categories(categoryId:11,name: "عامل بناء", image: "https://i0.wp.com/ar.alwataan.com/wp-content/uploads/2020/12/%D8%B9%D8%A7%D9%85%D9%84-%D8%A7%D9%84%D8%A8%D9%86%D8%A7%D8%A1.jpg"),
  Categories(categoryId:12,name: "حدادة", image: "https://img2.arabpng.com/20180613/qya/kisspng-blacksmith-drawing-clip-art-5b21da336b3786.6039081915289452034392.jpg"),
  Categories(categoryId:13,name: "نجارة", image: "https://i.pinimg.com/736x/95/d0/7c/95d07c3bf6a0a6e8900896c5a81039fc.jpg"),
  Categories(categoryId:14,name: "مفروشات", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwSXptsaiAJUEq1jQgEXI_G4TpeKtD5xA-cYu_UZ_ITbhTC9lSmPmN3PRSQdzz0-N2rTY&usqp=CAU"),
];

List<Search> searchByCategoryList = const[
  Search(
      workshopId: 0,
      name: "السلام الحديثة",
      picture: "https://syaaraat.com/public/storage/members/accounts/dealer/LDIwlDqcrl5xIeXD3dRcyN0fp5PYr01wbTXnnzdc.jpg",
      workshopType: "Electricity Workshop",
      phoneNumber: "+963 995967227",
      isFollowed: false,
  ),
  Search(
    workshopId: 1,
    name: "صقر الامارات",
    picture: "https://sazmoversuae.com/ar/images/logo.jpg",
    workshopType: "Electricity Workshop",
    phoneNumber: "+963 938716942",
    isFollowed: true,
  ),
  Search(
    workshopId: 2,
    name: "ورشة الحضارة",
    picture: "https://syaaraat.com/public/storage/members/accounts/dealer/LDIwlDqcrl5xIeXD3dRcyN0fp5PYr01wbTXnnzdc.jpg",
    workshopType: "Electricity Workshop",
    phoneNumber: "+963 962209347",
    isFollowed: true,
  ),
  Search(
    workshopId: 3,
    name: "شرق الدلتا",
    picture: "https://sazmoversuae.com/ar/images/logo.jpg",
    workshopType: "Electricity Workshop",
    phoneNumber: "+963 944474765",
    isFollowed: false,
  ),
  Search(
    workshopId: 4,
    name: "SLOGAN HERE",
    picture: "https://syaaraat.com/public/storage/members/accounts/dealer/LDIwlDqcrl5xIeXD3dRcyN0fp5PYr01wbTXnnzdc.jpg",
    workshopType: "Electricity Workshop",
    phoneNumber: "+963 944474765",
    isFollowed: false,
  ),
];

WorkshopProfile workshopProfileInformation = WorkshopProfile(workshopId: 33, name: "السلام الحديثة",
picture: "https://syaaraat.com/public/storage/members/accounts/dealer/LDIwlDqcrl5xIeXD3dRcyN0fp5PYr01wbTXnnzdc.jpg",
phoneNumber: "+963 995967227",
workshopType: "ورشة كهرباء", followers: "13 مليون", description: "ورشة كهرباء\nلدنيا اجد المعدات الحديثة\nيوجد لدينا كفالة ل5 سنوات واكثر",
 isFollowed: true, workshopPosts: postsList);

List<Search> searchList = const[
  Search(
    workshopId: 0,
    name: "السلام الحديثة",
    picture: "https://syaaraat.com/public/storage/members/accounts/dealer/LDIwlDqcrl5xIeXD3dRcyN0fp5PYr01wbTXnnzdc.jpg",
    workshopType: "Electricity Workshop",
    phoneNumber: "+963 995967227",
    isFollowed: false,
  ),
  Search(
    workshopId: 1,
    name: "صقر الامارات",
    picture: "https://sazmoversuae.com/ar/images/logo.jpg",
    workshopType: "Electricity Workshop",
    phoneNumber: "+963 938716942",
    isFollowed: true,
  ),
  Search(
    workshopId: 2,
    name: "ورشة الحضارة",
    picture: "https://syaaraat.com/public/storage/members/accounts/dealer/LDIwlDqcrl5xIeXD3dRcyN0fp5PYr01wbTXnnzdc.jpg",
    workshopType: "Electricity Workshop",
    phoneNumber: "+963 962209347",
    isFollowed: true,
  ),
  Search(
    workshopId: 3,
    name: "شرق الدلتا",
    picture: "https://sazmoversuae.com/ar/images/logo.jpg",
    workshopType: "Electricity Workshop",
    phoneNumber: "+963 944474765",
    isFollowed: false,
  ),
  Search(
    workshopId: 4,
    name: "SLOGAN HERE",
    picture: "https://syaaraat.com/public/storage/members/accounts/dealer/LDIwlDqcrl5xIeXD3dRcyN0fp5PYr01wbTXnnzdc.jpg",
    workshopType: "Electricity Workshop",
    phoneNumber: "+963 944474765",
    isFollowed: false,
  ),
];
