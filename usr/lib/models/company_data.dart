class CompanyData {
  final String name;
  final String symbol;
  final bool isPublic;
  final double? price;
  final double? changePercent;
  final String marketCap;
  final String? peRatio;
  final String? dividendYield;
  final String revenue;
  final InvestorSentiment? investorSentiment;
  final AiRecommendation aiRecommendation;
  final String description;

  CompanyData({
    required this.name,
    required this.symbol,
    required this.isPublic,
    this.price,
    this.changePercent,
    required this.marketCap,
    this.peRatio,
    this.dividendYield,
    required this.revenue,
    this.investorSentiment,
    required this.aiRecommendation,
    required this.description,
  });
}

class InvestorSentiment {
  final double buy;
  final double hold;
  final double sell;

  InvestorSentiment({required this.buy, required this.hold, required this.sell});
}

class AiRecommendation {
  final String verdict; // Buy, Sell, Hold, Watch
  final String reasoning;
  final double confidenceScore; // 0.0 to 1.0

  AiRecommendation({
    required this.verdict,
    required this.reasoning,
    required this.confidenceScore,
  });
}
