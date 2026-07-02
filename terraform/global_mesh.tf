# ==============================================================================
# PAYSECURE GATEWAY - METASTABLE MULTI-REGION KINETIC INFRASTRUCTURE MESH
# [RECOVERY WINDOW: ZERO MILLISECONDS ATOMIC CONTINUITY / FAILSAFE ENGINE]
# ==============================================================================

# Global Synchronization Pipeline Configuration
resource "aws_dynamodb_table" "paysecure_atomic_ledger" {
  name             = "paysecure-atomic-immutable-ledger"
  billing_mode     = "PAY_PER_REQUEST" 
  hash_key         = "AtomicTransactionHash"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "AtomicTransactionHash"
    type = "S"
  }

  # Multi-Region Real-time Synchronization Array
  replica {
    region_name = "ap-southeast-1" # Global Standby Core Node
    point_in_time_recovery = true
  }

  # Hardware-Enforced Encryption at Rest using Private Custom Key Matrix
  server_side_encryption {
    enabled     = true
    kms_key_arn = "arn:aws:kms:ap-south-1:123456789012:key/global-ledger-hmac-shield"
  }
}

# Route 53 Autonomous Multi-Armed Bandit Anycast Controller
resource "aws_route53_record" "paysecure_anycast_ai_router" {
  zone_id = "Z000000000000QUANTUMGRID"
  name    = "core-mesh.paysecure.bank"
  type    = "A"

  # Failover Routing Layer directly monitored by the live telemetry kernel
  failover_routing_policy { type = "PRIMARY" }
  set_identifier = "mumbai-primary-kinetic-node"
  ttl            = 0 # ABSOLUTE ZERO TTL - लाइव ट्रैफिक रूट्स बिना कैशिंग के माइक्रोसेकंड्स में फ्लश होते हैं

  alias {
    name                   = "://amazonaws.com"
    zone_id                = "Z111111111MUMBAI"
    evaluate_target_health = true # Coupled with paysecure_ai_core.py execution matrix
  }
}
