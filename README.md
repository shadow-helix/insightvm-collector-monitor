# insightvm-collector-monitor
Rapid7 don't provide a method to monitor the status of each individual customer's cloud platform collector (ingestion of on-prem/agent data). The situation can arise where the collector can be in an error state, and no monitoring is performed by Rapid7 to ensure that these are functioning correctly. This will result in reporting inconsistencies as InsightVM cloud data does not reflect the current vulnerability state of your assets.

This (quick and dirty) PowerShell script will query the cloud v4 integration API for any assets with a last scanned date within the previous 6 hours. If no results exist, then there is the potential that data is not being ingested properly and should be raised with Rapid7 support
