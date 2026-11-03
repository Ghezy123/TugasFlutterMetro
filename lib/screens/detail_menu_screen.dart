import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/info_badge.dart';

class DetailMenuScreen extends StatefulWidget {
  const DetailMenuScreen({super.key});

  @override
  State<DetailMenuScreen> createState() => _DetailMenuScreenState();
}

class _DetailMenuScreenState extends State<DetailMenuScreen> {
  // 2. Deklarasi state di kelas State
  bool isFavorite = false;
  int jumlahPesanan = 1;
  String catatanPesanan = '';
  final int hargaSatuan = 85000;

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
        // 3. Fitur Favorit di AppBar
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : AppColors.textSecondary,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
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
                  const SizedBox(height: 20),
                  // 4. Fitur Jumlah Pesanan (Atur Porsi)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Atur Porsi',
                        style: AppTextStyles.sectionTitle,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (jumlahPesanan > 1) {
                                setState(() {
                                  jumlahPesanan--;
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: AppColors.primary,
                            ),
                          ),
                          Text(
                            '$jumlahPesanan',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                jumlahPesanan++;
                              });
                            },
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 20),
                  // 6. Catatan Pesanan
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        catatanPesanan = value;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.notes, color: AppColors.primary),
                      labelText: 'Catatan Pesanan (Opsional)',
                      labelStyle: const TextStyle(color: AppColors.textSecondary),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                      ),
                    ),
                  ),
                  if (catatanPesanan.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Catatan: "$catatanPesanan"',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                  const SizedBox(height: 28),
                  // 5. Total Harga pada Tombol Pesan
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Pesanan berhasil: $jumlahPesanan porsi (Rp ${hargaSatuan * jumlahPesanan})',
                            ),
                            duration: const Duration(seconds: 2),
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
                      child: Text(
                        'Pesan Sekarang (Rp ${hargaSatuan * jumlahPesanan})',
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
