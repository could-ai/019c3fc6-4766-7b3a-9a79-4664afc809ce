import 'package:couldai_user_app/models/company_data.dart';

class MockStockService {
  static final List<CompanyData> _database = [
    CompanyData(
      name: "Apple Inc.",
      symbol: "AAPL",
      isPublic: true,
      price: 178.35,
      changePercent: 1.25,
      marketCap: "2.8T",
      peRatio: "29.5",
      dividendYield: "0.55%",
      revenue: "383.9B",
      description: "Apple Inc. designs, manufactures, and markets smartphones, personal computers, tablets, wearables, and accessories worldwide.",
      investorSentiment: InvestorSentiment(buy: 0.65, hold: 0.25, sell: 0.10),
      aiRecommendation: AiRecommendation(
        verdict: "Buy",
        reasoning: "Strong ecosystem retention and services growth offset hardware cyclicality. Cash flow remains robust.",
        confidenceScore: 0.88,
      ),
    ),
    CompanyData(
      name: "Tesla, Inc.",
      symbol: "TSLA",
      isPublic: true,
      price: 245.60,
      changePercent: -2.10,
      marketCap: "780B",
      peRatio: "72.1",
      dividendYield: "N/A",
      revenue: "96.7B",
      description: "Tesla, Inc. designs, develops, manufactures, leases, and sells electric vehicles, and energy generation and storage systems.",
      investorSentiment: InvestorSentiment(buy: 0.40, hold: 0.30, sell: 0.30),
      aiRecommendation: AiRecommendation(
        verdict: "Hold",
        reasoning: "High valuation multiples compared to industry peers. Innovation premium is high, but margin compression is a risk.",
        confidenceScore: 0.65,
      ),
    ),
    CompanyData(
      name: "SpaceX",
      symbol: "SPACE",
      isPublic: false,
      marketCap: "150B (Est.)",
      revenue: "4.6B (Est.)",
      description: "Space Exploration Technologies Corp. is an American spacecraft manufacturer, launch service provider, defense contractor and satellite communications company.",
      investorSentiment: null, // Private company
      aiRecommendation: AiRecommendation(
        verdict: "Watch",
        reasoning: "Dominant market position in launch services. Starlink revenue growing rapidly. Potential IPO would be highly anticipated.",
        confidenceScore: 0.92,
      ),
    ),
    CompanyData(
      name: "NVIDIA Corporation",
      symbol: "NVDA",
      isPublic: true,
      price: 460.18,
      changePercent: 3.40,
      marketCap: "1.1T",
      peRatio: "110.5",
      dividendYield: "0.04%",
      revenue: "27.0B",
      description: "NVIDIA Corporation provides graphics, compute and networking solutions. It is a leader in AI hardware.",
      investorSentiment: InvestorSentiment(buy: 0.80, hold: 0.15, sell: 0.05),
      aiRecommendation: AiRecommendation(
        verdict: "Buy",
        reasoning: "Unmatched demand for AI data center chips. Market leader in a rapidly expanding sector.",
        confidenceScore: 0.95,
      ),
    ),
    CompanyData(
      name: "Stripe",
      symbol: "STRIP",
      isPublic: false,
      marketCap: "50B (Est.)",
      revenue: "14B (Est.)",
      description: "Stripe, Inc. provides financial infrastructure platform for the internet. It builds economic infrastructure for the internet.",
      investorSentiment: null,
      aiRecommendation: AiRecommendation(
        verdict: "Watch",
        reasoning: "Key player in digital payments infrastructure. Strong growth despite fintech market corrections.",
        confidenceScore: 0.85,
      ),
    ),
  ];

  Future<List<CompanyData>> searchCompanies(String query) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));

    if (query.isEmpty) return [];

    final lowercaseQuery = query.toLowerCase();
    return _database.where((company) {
      return company.name.toLowerCase().contains(lowercaseQuery) ||
             company.symbol.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }

  Future<CompanyData?> getCompanyBySymbol(String symbol) async {
    await Future.delayed(const Duration(milliseconds: 400));
    try {
      return _database.firstWhere((c) => c.symbol == symbol);
    } catch (e) {
      return null;
    }
  }
}
