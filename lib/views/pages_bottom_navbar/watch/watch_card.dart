import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/modals/movie_modal/movie_modals.dart';
import 'package:movie_app/routes/routes.dart';

class MovieCard extends StatelessWidget {
  final MovieModal movieModal;
  const MovieCard({
    Key? key,
    required this.movieModal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: (() {
              int id = movieModal.id;
              var release_date = movieModal.release_date;
              Get.toNamed(
                AppLinks.moviedetailscreen,
                arguments: {
                  "id": id,
                  "release_date": release_date,
                },
              );
            }),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: (movieModal.backdrop_path.isNotEmpty)
                  ? Image.network(movieModal.backdrop_path.toString(),
                      fit: BoxFit.cover)
                  : Image.asset("assets/moviebanner.jpg", fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 8),
                    color: Colors.black12.withOpacity(0.1),
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.fromLTRB(20, 27, 0, 20),
              child: Text(
                movieModal.title,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
            )),
      ],
    );
  }
}
