import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/company_data.dart';

class DetailsScreen extends StatelessWidget {
  final CompanyData company;

  const DetailsScreen({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(company.symbol),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildStatusBanner(),
            const SizedBox(height: 24),
            _buildFinancialDetails(),
            const SizedBox(height: 24),
            if (company.isPublic) ...[
              _buildInvestorSentiment(),
              const SizedBox(height: 24),
            ],
            _buildAiRecommendation(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          company.name,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          company.description,
          style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.4),
        ),
      ],
    );
  }

  Widget _buildStatusBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: company.isPublic ? Colors.green[50] : Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: company.isPublic ? Colors.green.shade200 : Colors.orange.shade200,
        ),
      ),
      child: Row(
        children: [
          Icon(
            company.isPublic ? Icons.public : Icons.lock_outline,
            color: company.isPublic ? Colors.green[700] : Colors.orange[800],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              company.isPublic
                  ? "Publicly Traded Company"
                  : "Private Company - Not Publicly Traded",
              style: TextStyle(
                color: company.isPublic ? Colors.green[900] : Colors.orange[900],
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialDetails() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Financial Overview",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (company.isPublic) ...[
              _buildDetailRow("Current Price", "\$${company.price?.toStringAsFixed(2)}"),
              _buildDetailRow("Change", "${company.changePercent}%", 
                valueColor: (company.changePercent ?? 0) >= 0 ? Colors.green : Colors.red),
              const Divider(height: 24),
            ],
            _buildDetailRow("Market Cap / Valuation", company.marketCap),
            _buildDetailRow("Revenue", company.revenue),
            if (company.isPublic) ...[
              _buildDetailRow("P/E Ratio", company.peRatio ?? "N/A"),
              _buildDetailRow("Dividend Yield", company.dividendYield ?? "N/A"),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 15)),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: valueColor ?? Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvestorSentiment() {
    final sentiment = company.investorSentiment!;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Investor Sentiment",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 30,
                child: Row(
                  children: [
                    Expanded(
                      flex: (sentiment.buy * 100).toInt(),
                      child: Container(color: Colors.green, child: const Center(child: Text("Buy", style: TextStyle(color: Colors.white, fontSize: 10)))),
                    ),
                    Expanded(
                      flex: (sentiment.hold * 100).toInt(),
                      child: Container(color: Colors.grey, child: const Center(child: Text("Hold", style: TextStyle(color: Colors.white, fontSize: 10)))),
                    ),
                    Expanded(
                      flex: (sentiment.sell * 100).toInt(),
                      child: Container(color: Colors.red, child: const Center(child: Text("Sell", style: TextStyle(color: Colors.white, fontSize: 10)))),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Buy: ${(sentiment.buy * 100).toInt()}%", style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                Text("Hold: ${(sentiment.hold * 100).toInt()}%", style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                Text("Sell: ${(sentiment.sell * 100).toInt()}%", style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAiRecommendation() {
    Color cardColor;
    IconData icon;
    
    switch (company.aiRecommendation.verdict.toLowerCase()) {
      case 'buy':
        cardColor = Colors.green.shade50;
        icon = Icons.trending_up;
        break;
      case 'sell':
        cardColor = Colors.red.shade50;
        icon = Icons.trending_down;
        break;
      case 'hold':
        cardColor = Colors.grey.shade100;
        icon = Icons.remove_circle_outline;
        break;
      default:
        cardColor = Colors.blue.shade50;
        icon = Icons.visibility;
    }

    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.blue.withOpacity(0.3), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.auto_awesome, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 12),
                const Text(
                  "AI Analysis",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(icon, size: 32, color: Colors.black87),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Recommendation", style: TextStyle(fontSize: 12, color: Colors.black54)),
                      Text(
                        company.aiRecommendation.verdict.toUpperCase(),
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 1.2),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("Confidence", style: TextStyle(fontSize: 12, color: Colors.black54)),
                      Text(
                        "${(company.aiRecommendation.confidenceScore * 100).toInt()}%",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Reasoning:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              company.aiRecommendation.reasoning,
              style: const TextStyle(fontSize: 15, height: 1.5, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
