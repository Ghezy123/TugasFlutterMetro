import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/info_badge.dart';

class DetailMenuScreen extends StatelessWidget {
  const DetailMenuScreen({super.key});

  static const String _imageUrl =
      'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=1000&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Detail Menu',
          style: AppTextStyles.appBarTitle,
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              _imageUrl,
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 240,
                  width: double.infinity,
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 240,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.broken_image, size: 48, color: Colors.grey),
                      SizedBox(height: 8),
                      Text('Gagal memuat gambar', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pizza Margherita',
                        style: AppTextStyles.productTitle,
                      ),
                      Text(
                        'Rp 85.000',
                        style: AppTextStyles.productPrice,
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InfoBadge(
                          icon: Icons.star,
                          iconColor: AppColors.starIcon,
                          label: '4.9',
                        ),
                        InfoBadge(
                          icon: Icons.access_time,
                          iconColor: AppColors.timeIcon,
                          label: '20 menit',
                        ),
                        InfoBadge(
                          icon: Icons.local_fire_department,
                          iconColor: AppColors.fireIcon,
                          label: '280 kal',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'Deskripsi',
                    style: AppTextStyles.sectionTitle,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Perpaduan adonan renyah khas Italia dengan lelehan keju mozzarella premium, '
                    'saus tomat San Marzano segar, serta taburan daun basil aromatik. '
                    'Dipanggang sempurna langsung dari oven kayu tradisional.',
                    style: AppTextStyles.descriptionBody,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Pesanan berhasil ditambahkan!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textLight,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Text(
                        'Pesan Sekarang',
                        style: AppTextStyles.buttonLabel,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
