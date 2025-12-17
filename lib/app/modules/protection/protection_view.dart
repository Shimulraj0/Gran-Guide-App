import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import 'protection_controller.dart';

class ProtectionView extends GetView<ProtectionController> {
  const ProtectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Protection',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Start Lesson Toggle (Ref image says "Start Lessen", assuming typ for Listen/Lesson or just a toggle label)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Start Lessen",
                  style: TextStyle(
                    color: Color(0xFF5ebbf1),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Obx(
                  () => Switch(
                    value: controller.isProtectionEnabled.value,
                    onChanged: controller.toggleProtection,
                    activeThumbColor: Colors.white,
                    activeTrackColor: const Color(0xFF1fa4e4),
                  ),
                ),
              ],
            ),
            const Text(
              "Protection Status",
              style: TextStyle(fontSize: 12, color: Color(0xFF1fa4e4)),
            ),
            const SizedBox(height: 12),

            // Protection Mode Card
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.verified_user,
                          size: 50,
                          color: Color(0xFF1fa4e4),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "PROTECTION MODE",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight
                                .bold, // Assuming bold from image look
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Status: ON",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "You are protected from scam calls, texts, and emails.",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Icon(Icons.lock, color: Colors.grey, size: 28),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Caregiver Control Notice:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                "Only caregivers can change this setting.",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Protection Summary
            const Text(
              "Protection Summary:",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildSummaryRow("Calls Blocked:", "3 Today", Colors.green),
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "You are protected from scam calls, texts, and emails.",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  const Divider(height: 1),
                  _buildSummaryRow(
                    "Suspicious Messages:",
                    "1 Flagged",
                    Colors.green,
                  ),
                  const Divider(height: 1),
                  _buildSummaryRow(
                    "Safe Contacts:",
                    "5 Verified",
                    Colors.green,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Risk Alerts
            Row(
              children: const [
                Icon(Icons.circle, color: Colors.red, size: 20),
                SizedBox(width: 8),
                Text(
                  "Risk Alerts:",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildAlertCard(
              title: "Blocked Call: +880191XXXXXXX",
              reason: "Reported by many users",
              riskScore: "94 / 100",
              actionText: "[View Details]",
              borderColor: Colors.red.withOpacity(0.3), // Subtle border?
            ),

            const SizedBox(height: 24),
            Row(
              children: const [
                Icon(Icons.circle, color: Colors.amber, size: 20),
                SizedBox(width: 8),
                Text(
                  "Medium-Risk",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildAlertCard(
              title: "Blocked Call: +880190XXXXXXX",
              reason: "Reported by many users",
              riskScore: "94 / 100",
              actionText: "[Review Email]",
              borderColor: Colors.amber.withOpacity(0.3),
            ),

            const SizedBox(height: 24),
            Row(
              children: const [
                Icon(Icons.circle, color: Colors.green, size: 20),
                SizedBox(width: 8),
                Text(
                  "Safe",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      children: [
                        const TextSpan(text: "Message "),
                        TextSpan(
                          text: "from: ",
                          style: const TextStyle(color: Color(0xFF1fa4e4)),
                        ),
                        const TextSpan(text: "Daughter"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "See you tomorrow!",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const Divider(height: 24),
                  const Text(
                    "Marked Safe",
                    style: TextStyle(color: Colors.green, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: Text(
                      "[No action needed]",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            // Caregiver Controls
            const Text(
              "Caregiver Controls",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1fa4e4),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Trusted Caregiver Access",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                      children: [
                        const TextSpan(text: "Manage "),
                        TextSpan(
                          text: "call",
                          style: const TextStyle(color: Color(0xFF1fa4e4)),
                        ),
                        const TextSpan(text: "/message approvals"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Add/Remove trusted contacts",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const Divider(height: 24),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                      children: [
                        const TextSpan(text: "Change "),
                        TextSpan(
                          text: "filter",
                          style: const TextStyle(color: Color(0xFF1fa4e4)),
                        ),
                        const TextSpan(text: " rules (e.g., block "),
                        TextSpan(
                          text: "unknown",
                          style: const TextStyle(color: Colors.amber),
                        ),
                        const TextSpan(text: " numbers)"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Center(
                    child: Text(
                      "[Manage Protection Settings]",
                      style: TextStyle(
                        color: Color(0xFF1fa4e4),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            // Link Scanner
            const Text(
              "Link Scanner",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1fa4e4),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Got a suspicious link? Paste it here:",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Text(
                        "[ ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Input field",
                        style: TextStyle(
                          color: Color(0xFF1fa4e4),
                          fontSize: 14,
                        ),
                      ),
                      const Text(
                        " ] [",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Scan Button",
                        style: TextStyle(
                          color: Colors.orange.shade300,
                          fontSize: 14,
                        ),
                      ),
                      const Text(
                        " ]",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      Icon(Icons.shield, color: Color(0xFF1fa4e4), size: 18),
                      SizedBox(width: 8),
                      Text(
                        "Results: Safe",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.warning, color: Colors.red, size: 18),
                      SizedBox(width: 8),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 14, color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Risky - ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "Don't click",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }

  Widget _buildSummaryRow(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(width: 4),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertCard({
    required String title,
    required String reason,
    required String riskScore,
    required String actionText,
    Color? borderColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Parse title to color 'Call' text
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    children: [
                      const TextSpan(text: "Blocked "),
                      TextSpan(
                        text: "Call",
                        style: const TextStyle(color: Colors.amber),
                      ),
                      TextSpan(
                        text: title.replaceAll("Blocked Call", ""),
                      ), // Very naive replacement for demo
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    children: [
                      TextSpan(
                        text: "Reason: ",
                        style: const TextStyle(color: Color(0xFF1fa4e4)),
                      ),
                      TextSpan(text: reason),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    children: [
                      const TextSpan(text: "Risk Score: "),
                      TextSpan(
                        text: riskScore,
                        style: const TextStyle(color: Color(0xFF1fa4e4)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                actionText,
                style: const TextStyle(
                  color: Color(0xFF9747FF),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
