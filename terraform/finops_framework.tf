# ==============================================================================
# PROJECT 3: LENDFLOW TECHNOLOGIES - SELF-SYNTHESIZING KINETIC BUDGET FRAMEWORK
# [CLASSIFICATION: HARD-STOP ARCHITECTURAL KILL-SWITCH / ANTI-HYPERSCALER]
# ==============================================================================

terraform {
  required_version = ">= 1.9.0"
  required_providers {
    aws = { source = "hashicorp/aws" \n version = "~> 5.50" }
  }
}

# 1. Anti-Drain Cloud Budget Kill-Switch (अगर AWS चोरी छिपे पैसे बढ़ाए तो यह एक्टिव होगा)
resource "aws_budgets_budget" "lendflow_autonomous_kill_switch" {
  name              = "lendflow-absolute-zero-drain-guard"
  budget_type       = "COST"
  limit_amount      = "100.0" # नाममात्र की सीमा—जैसे ही $100 पार होंगे, एआई अलार्म बजेगा
  limit_unit        = "USD"
  time_period_start = "2026-01-01_00:00"
  time_unit         = "DAILY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 95
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["autonomous-termination-daemon@lendflow.ai"]
  }
}

# 2. Dynamic Evacuation Webhook Controller
resource "aws_sns_topic" "evacuation_signal" {
  name = "lendflow-infrastructure-evacuation-bus"
}

# यह सब्सक्रिप्शन सीधे हमारे एआई इंजन को सिग्नल भेजता है कि AWS छोड़ो और भागो!
resource "aws_sns_topic_subscription" "ai_evacuation_trigger" {
  topic_arn = aws_sns_topic.evacuation_signal.arn
  protocol  = "lambda"
  endpoint  = "arn:aws:lambda:ap-south-1:123456789012:function:LendFlowTeleportationDaemon"
}
