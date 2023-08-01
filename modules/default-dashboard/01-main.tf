resource "datadog_dashboard" "default_dashboard" {
  title        = var.title
  description  = var.description
  layout_type  = "ordered"
  is_read_only = var.is_read_only

  widget {
    timeseries_definition{
        request {
            query {
              metric_query {
                data_source = "metrics"
                query = "avg:kubernetes.cpu.usage.total{kube_service:${var.service_name}}"
                name = "query1"
              }
            }
            query {
              metric_query {
                data_source = "metrics"
                query = "avg:kubernetes.cpu.requests{kube_service:${var.service_name}}"
                name = "query2"
              }
            }
            formula {
              formula_expression = "query1 / query2 * 1e-7"
              alias = "CPU Usage in percentile"
            }
        }

        title = "CPU Usage in percentile"
        live_span = "1h"
    }
  }

  widget {
    timeseries_definition{
        request {
            formula {
              formula_expression = "query1"
              alias = "CPU Usage"
            }
            formula {
              formula_expression = "query2"
              alias = "Requested"
            }
            query {
              metric_query {
                data_source = "metrics"
                query = "avg:kubernetes.cpu.usage.total{kube_service:${var.service_name}}"
                name = "query1"
              }
            }
            query {
              metric_query {
                data_source = "metrics"
                query = "avg:kubernetes.cpu.requests{kube_service:${var.service_name}}"
                name = "query2"
              }
            }
        }

        title = "CPU Usage per limit"
        live_span = "1h"
    }
  }

  widget {
    timeseries_definition{
        request {
            query {
              metric_query {
                data_source = "metrics"
                query = "avg:kubernetes.memory.usage{kube_service:${var.service_name}}"
                name = "query1"
              }
            }
            query {
              metric_query {
                data_source = "metrics"
                query = "avg:kubernetes.memory.limits{kube_service:${var.service_name}}"
                name = "query2"
              }
            }
            formula {
              formula_expression = "query1 / query2 * 100"
              alias = "Memory usage in percentile"
            }
        }

        title = "Memory usage in percentile"
        live_span = "1h"
    }
  }

  widget {
    timeseries_definition{
        request {
            formula {
              formula_expression = "query1"
              alias = "Memory Usage"
            }
            formula {
              formula_expression = "query2"
              alias = "Limit"
            }
            query {
              metric_query {
                data_source = "metrics"
                query = "avg:kubernetes.memory.usage{kube_service:${var.service_name}}"
                name = "query1"
              }
            }
            query {
              metric_query {
                data_source = "metrics"
                query = "avg:kubernetes.memory.limits{kube_service:${var.service_name}}"
                name = "query2"
              }
            }
        }

        title = "Memory Usage per limit"
        live_span = "1h"
    }
  }
}