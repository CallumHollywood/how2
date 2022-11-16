#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import dplyr
#' @noRd
app_server <- function(input, output, session) {


  #### <<<<    gargoyle        >>>>  ####
  #-------------------------------------#

  #### <<<<    CALLMODULES     >>>>  ####
  #-------------------------------------#

  #### <<<<    STATIC VALUES   >>>>  ####
  #-------------------------------------#


  #### <<<<   REACTIVES        >>>>  ####
  #-------------------------------------#


  #### <<<<   REACTIVES VALS   >>>>  ####
  #-------------------------------------#


  #### <<<<   EVENT REACTIVES  >>>>  ####
  #-------------------------------------#


  fetched_iframe <- eventReactive(input$btn_fetch, {

    iframe_record <- iframe_records %>%
      filter(howto == input$slt_iframe) %>%
      pull(iframe)

    print(iframe_record)
    print('iframe_record')


    return(iframe_record)

  })


  #### <<<<   OBSERVES         >>>>  ####
  #-------------------------------------#


  #### <<<<   OBSERVE EVENTS   >>>>  ####
  #-------------------------------------#

  observeEvent(fetched_iframe(),{

    # print(fetched_iframe())

  })



  #### <<<<    OUTPUTS         >>>>  ####
  #-------------------------------------#

  output$ot_iframe <- renderUI({


    tagList(
      tags$iframe(
        seamless = "seamless",
        # src = "https://www.youtube.com/embed/Q2XO4Ug57cY?start=382",
        src = fetched_iframe(),
        height = 800, width = 1400
      )

    )

  })



  #### <<<<    OUTPUT OPTIONS  >>>>  ####
  #-------------------------------------#

}
