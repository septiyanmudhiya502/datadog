resource "datadog_dashboard" "ordered_dashboard" {
  title        = "Ordered Layout Dashboard"
  description  = "Created using the Datadog provider in Terraform"
  layout_type  = "ordered"
  is_read_only = true

  widget {
    timeseries_definition {
      request {
        q = "avg:trace.http.request.duration{service:uploader}.rollup(avg, 60)"
      }

      title     = "Average trace duration"
      live_span = "1h"
    }
  }

  widget {
    timeseries_definition {
        request {
            q = "sum:trace.http.request.error{service:uploader}.rollup(sum, 60)"
        }

        title = "Error Count"
        live_span = "1h"
    }
  }

  widget {
    timeseries_definition {
        request {
            q = "sum:trace.http.request.hits{service:uploader}.rollup(sum, 60)"
        }

        title = "Trace Hits"
        live_span = "1h"
    }
  }

  widget {
    timeseries_definition{
        request {
            q = "avg:service.latency{service:uploader}.rollup(avg, 60)"
        }

        title = "Average service latency"
        live_span = "1h"
    }
  }
}