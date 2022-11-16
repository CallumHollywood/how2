#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import bs4Dash
#' @noRd


iframe_records <- readr::read_csv('data-raw/iframe_records.csv')



app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    dashboardPage(
      dashboardHeader(title = "Basic dashboard"),
      dashboardSidebar(),
      dashboardBody(
        # Boxes need to be put in a row (or column)
        fluidRow(
          box(
            width = 12,
            selectInput('slt_iframe',
                        'Select',
                        choices = iframe_records$howto
            ),
            br(),
            actionButton('btn_fetch', 'Fetch')
          ),
        ),
        br(),
        fluidRow(
          box(
            width = 12,
            uiOutput('ot_iframe')
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "how2"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
