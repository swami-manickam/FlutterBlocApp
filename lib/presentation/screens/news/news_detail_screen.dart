import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewsDetailScreen extends StatefulWidget {
  String newsImage;
  String newsTitle;
  String newsDate;
  String newsAuthor;
  String newsDesc;
  String newsContent;
  String newsSource;

  NewsDetailScreen(this.newsImage, this.newsTitle, this.newsDate,
      this.newsAuthor, this.newsDesc, this.newsContent, this.newsSource,
      {super.key});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  final format = DateFormat('MMMM dd,yyyy');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    DateTime dateTime = DateTime.parse(widget.newsDate);

    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[1600],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
              child: Container(
            height: mHeight,
            width: mWidth,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              child: Image.network(
                widget.newsImage,
                fit: BoxFit.cover,
                errorBuilder: (context, url, error) => Image.asset(
                  'assets/images/ic_no_data.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
          Container(
            margin: EdgeInsets.only(top: mHeight * 0.4),
            padding: EdgeInsets.only(top: 20, right: 20, left: 20),
            height: mHeight * 0.6,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: ListView(
              children: [
                Text(widget.newsTitle,
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700)),
                SizedBox(height: mHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        child: Text(
                          widget.newsSource,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Text(
                      '${format.format(dateTime)}',
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: mHeight * 0.03,
                ),
                Text('${widget.newsDesc}',
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: mHeight * 0.03,
                ),
                // Text('${widget.newsContent}',
                //     maxLines: 20,
                //     style: GoogleFonts.poppins(
                //         fontSize: 15,
                //         color: Colors.black87,
                //         fontWeight: FontWeight.w500)),
                SizedBox(
                  height: mHeight * 0.03,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
