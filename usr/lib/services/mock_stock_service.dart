import 'dart:math';
import 'package:couldai_user_app/models/company_data.dart';

class MockStockService {
  // Expanded hardcoded database with major companies
  static final List<CompanyData> _database = [
    // Tech Giants
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
      name: "Microsoft Corporation",
      symbol: "MSFT",
      isPublic: true,
      price: 330.00,
      changePercent: 0.80,
      marketCap: "2.5T",
      peRatio: "35.2",
      dividendYield: "0.80%",
      revenue: "211.9B",
      description: "Microsoft Corporation develops, licenses, and supports software, services, devices, and solutions worldwide.",
      investorSentiment: InvestorSentiment(buy: 0.75, hold: 0.20, sell: 0.05),
      aiRecommendation: AiRecommendation(
        verdict: "Buy",
        reasoning: "Leader in cloud computing (Azure) and AI integration across productivity suites. Strong recurring revenue.",
        confidenceScore: 0.92,
      ),
    ),
    CompanyData(
      name: "Alphabet Inc.",
      symbol: "GOOGL",
      isPublic: true,
      price: 138.00,
      changePercent: -0.50,
      marketCap: "1.7T",
      peRatio: "28.1",
      dividendYield: "N/A",
      revenue: "282.8B",
      description: "Alphabet Inc. offers various products and platforms in the United States, Europe, the Middle East, Africa, the Asia-Pacific, Canada, and Latin America.",
      investorSentiment: InvestorSentiment(buy: 0.70, hold: 0.25, sell: 0.05),
      aiRecommendation: AiRecommendation(
        verdict: "Buy",
        reasoning: "Dominant search market share and growing cloud business. AI investments are beginning to show integration potential.",
        confidenceScore: 0.85,
      ),
    ),
    CompanyData(
      name: "Amazon.com, Inc.",
      symbol: "AMZN",
      isPublic: true,
      price: 145.00,
      changePercent: 1.10,
      marketCap: "1.5T",
      peRatio: "105.0",
      dividendYield: "N/A",
      revenue: "514.0B",
      description: "Amazon.com, Inc. engages in the retail sale of consumer products and subscriptions in North America and internationally.",
      investorSentiment: InvestorSentiment(buy: 0.60, hold: 0.30, sell: 0.10),
      aiRecommendation: AiRecommendation(
        verdict: "Buy",
        reasoning: "AWS remains the cloud leader. E-commerce margins are improving with logistics optimization.",
        confidenceScore: 0.80,
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
      name: "Meta Platforms, Inc.",
      symbol: "META",
      isPublic: true,
      price: 300.00,
      changePercent: 0.90,
      marketCap: "770B",
      peRatio: "34.0",
      dividendYield: "N/A",
      revenue: "116.6B",
      description: "Meta Platforms, Inc. develops products that enable people to connect and share with friends and family through mobile devices, personal computers, virtual reality headsets, and wearables.",
      investorSentiment: InvestorSentiment(buy: 0.55, hold: 0.35, sell: 0.10),
      aiRecommendation: AiRecommendation(
        verdict: "Hold",
        reasoning: "Strong ad revenue recovery, but heavy spending on Reality Labs metaverse projects remains a concern for margins.",
        confidenceScore: 0.70,
      ),
    ),
    
    // Finance
    CompanyData(
      name: "JPMorgan Chase & Co.",
      symbol: "JPM",
      isPublic: true,
      price: 145.00,
      changePercent: 0.50,
      marketCap: "420B",
      peRatio: "10.5",
      dividendYield: "2.80%",
      revenue: "128.7B",
      description: "JPMorgan Chase & Co. operates as a financial services company worldwide.",
      investorSentiment: InvestorSentiment(buy: 0.60, hold: 0.30, sell: 0.10),
      aiRecommendation: AiRecommendation(
        verdict: "Buy",
        reasoning: "Strong balance sheet and beneficiary of higher interest rate environment. Leading position in banking.",
        confidenceScore: 0.82,
      ),
    ),
    CompanyData(
      name: "Berkshire Hathaway Inc.",
      symbol: "BRK.B",
      isPublic: true,
      price: 355.00,
      changePercent: 0.20,
      marketCap: "780B",
      peRatio: "N/A",
      dividendYield: "N/A",
      revenue: "302.1B",
      description: "Berkshire Hathaway Inc. engages in the insurance, freight rail transportation, and utility businesses worldwide.",
      investorSentiment: InvestorSentiment(buy: 0.50, hold: 0.45, sell: 0.05),
      aiRecommendation: AiRecommendation(
        verdict: "Hold",
        reasoning: "Diversified conglomerate with strong cash reserves. Defensive play in volatile markets.",
        confidenceScore: 0.78,
      ),
    ),

    // Consumer
    CompanyData(
      name: "Coca-Cola Company",
      symbol: "KO",
      isPublic: true,
      price: 58.00,
      changePercent: -0.10,
      marketCap: "250B",
      peRatio: "24.0",
      dividendYield: "3.10%",
      revenue: "43.0B",
      description: "The Coca-Cola Company, a beverage company, manufactures, markets, and sells various nonalcoholic beverages worldwide.",
      investorSentiment: InvestorSentiment(buy: 0.40, hold: 0.50, sell: 0.10),
      aiRecommendation: AiRecommendation(
        verdict: "Hold",
        reasoning: "Solid dividend payer and defensive stock. Growth is slow but steady.",
        confidenceScore: 0.75,
      ),
    ),
    CompanyData(
      name: "Walmart Inc.",
      symbol: "WMT",
      isPublic: true,
      price: 160.00,
      changePercent: 0.30,
      marketCap: "430B",
      peRatio: "30.0",
      dividendYield: "1.40%",
      revenue: "611.3B",
      description: "Walmart Inc. engages in the operation of retail, wholesale, and other units worldwide.",
      investorSentiment: InvestorSentiment(buy: 0.55, hold: 0.35, sell: 0.10),
      aiRecommendation: AiRecommendation(
        verdict: "Buy",
        reasoning: "Dominant retailer with growing e-commerce presence. resilient in economic downturns.",
        confidenceScore: 0.80,
      ),
    ),

    // Private Companies
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
    CompanyData(
      name: "OpenAI",
      symbol: "OPENAI",
      isPublic: false,
      marketCap: "80B (Est.)",
      revenue: "1.3B (Est.)",
      description: "OpenAI is an AI research and deployment company dedicated to ensuring that artificial general intelligence benefits all of humanity.",
      investorSentiment: null,
      aiRecommendation: AiRecommendation(
        verdict: "Watch",
        reasoning: "Leader in generative AI. Massive growth potential but regulatory and competition risks exist.",
        confidenceScore: 0.90,
      ),
    ),
  ];

  Future<List<CompanyData>> searchCompanies(String query) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));

    if (query.isEmpty) return [];

    final lowercaseQuery = query.toLowerCase();
    
    // 1. Try to find exact or partial matches in our hardcoded "popular" database
    final knownMatches = _database.where((company) {
      return company.name.toLowerCase().contains(lowercaseQuery) ||
             company.symbol.toLowerCase().contains(lowercaseQuery);
    }).toList();

    if (knownMatches.isNotEmpty) {
      return knownMatches;
    }

    // 2. If no matches found, GENERATE a realistic mock company
    // This simulates "all publicly traded companies" without needing a massive database.
    return [_generateMockCompany(query)];
  }

  // Generates a consistent mock company based on the query string
  CompanyData _generateMockCompany(String query) {
    // Use the query string to seed a random number generator so the result is consistent for the same query
    int seed = query.codeUnits.fold(0, (p, c) => p + c);
    final random = Random(seed);

    String symbol = query.toUpperCase();
    if (symbol.length > 5) symbol = symbol.substring(0, 4); // Truncate if too long for a symbol
    
    // Capitalize first letter of query for name
    String name = query.split(' ').map((str) => str.isNotEmpty ? '${str[0].toUpperCase()}${str.substring(1)}' : '').join(' ');
    if (!name.toLowerCase().contains("inc") && !name.toLowerCase().contains("corp")) {
      name += " Inc.";
    }

    // Randomize financial data
    double price = 10.0 + random.nextDouble() * 400.0; // $10 - $410
    double change = (random.nextDouble() * 10.0) - 5.0; // -5% to +5%
    bool isPositive = change >= 0;
    
    // Market Cap logic
    double marketCapVal = 1.0 + random.nextDouble() * 500.0; // 1B - 500B
    String marketCap = "${marketCapVal.toStringAsFixed(1)}B";

    // PE Ratio
    double pe = 10.0 + random.nextDouble() * 80.0;
    
    // Sentiment
    double buy = 0.1 + random.nextDouble() * 0.8;
    double hold = (1.0 - buy) * random.nextDouble();
    double sell = 1.0 - buy - hold;

    // AI Verdict
    List<String> verdicts = ["Buy", "Hold", "Sell"];
    String verdict = verdicts[random.nextInt(verdicts.length)];
    
    String reasoning = "";
    if (verdict == "Buy") {
      reasoning = "Strong fundamentals and positive technical indicators suggest upside potential. Revenue growth is accelerating.";
    } else if (verdict == "Sell") {
      reasoning = "Headwinds in the sector and declining margins present risks. Valuation appears stretched at current levels.";
    } else {
      reasoning = "Market conditions are uncertain. Stock is trading within a fair value range. Wait for a clearer entry point.";
    }

    return CompanyData(
      name: name,
      symbol: symbol,
      isPublic: true, // Assume searched companies are public for this "include all" feature
      price: price,
      changePercent: change,
      marketCap: marketCap,
      peRatio: pe.toStringAsFixed(1),
      dividendYield: "${(random.nextDouble() * 4.0).toStringAsFixed(2)}%",
      revenue: "${(marketCapVal * 0.2).toStringAsFixed(1)}B",
      description: "$name is a publicly traded company operating in the global market. It provides various products and services to consumers and businesses.",
      investorSentiment: InvestorSentiment(buy: buy, hold: hold, sell: sell),
      aiRecommendation: AiRecommendation(
        verdict: verdict,
        reasoning: reasoning,
        confidenceScore: 0.60 + random.nextDouble() * 0.35,
      ),
    );
  }
}
