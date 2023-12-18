import 'package:dio/dio.dart';
import 'package:submission02/data/base/base_url.dart';
import 'package:submission02/data/model/review.dart';

class ApiServices {
  Dio dio = Dio();

  ApiServices() {
    dio = Dio(BaseOptions(baseUrl: base));
  }

  Future<List<Review>> fetchReview(String endPoint) async {
    try {
      final response = await dio.get(endPoint);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        print(data);
        List<Review> reviews = data.map((reviewsData) {
          return Review(
              id: reviewsData['id'],
              name: reviewsData['name'],
              review: reviewsData['review'],
              date: reviewsData['date']);
        }).toList();
        return reviews;
      } else {
        throw Exception('Failed to load reviews');
      }
    } catch (e) {
      throw Exception('Faild to load reviews: $e');
    }
  }

  Future<Review> createReview(
      {required String name,
      required String review,
      required String date}) async {
    try {
      final response = await dio.post("/review",
          data: {'name': name, 'review': review, 'date': date});

      if (response.statusCode == 201) {
        final reviewData = response.data as Map<String, dynamic>;
        final review = Review(
          id: reviewData['id'],
          name: reviewData['name'],
          review: reviewData['review'],
          date: reviewData['date'],
        );
        return review;
      } else {
        throw Exception('Failed to create reviews');
      }
    } catch (e) {
      throw Exception('Failed to create reviews: $e');
    }
  }
}
