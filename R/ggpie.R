#'@include utilities.R ggpar.R
NULL
#'Pie chart
#'@description Create a pie chart.
#'@inheritParams ggboxplot
#'@inheritParams ggplot2::geom_errorbar
#'@param x variable containing values for drawing.
#'@param label variable specifying the label of each slice.
#'@param lab.pos character specifying the position for labels. Allowed values
#'   are "out" (for outside) or "in" (for inside).
#' @param lab.font a vector of length 3 indicating respectively
#'   the size (e.g.: 14), the style (e.g.: "plain", "bold", "italic",
#'   "bold.italic") and the color (e.g.: "red") of label font. For example \emph{lab.font= c(4, "bold", "red")}.
#'@param color,fill outline and fill colors.
#'@param ... other arguments to be passed to be passed to ggpar().
#'@details The plot can be easily customized using the function ggpar(). Read
#'   ?ggpar for changing: \itemize{ \item main title and axis labels: main,
#'   xlab, ylab \item axis limits: xlim, ylim (e.g.: ylim = c(0, 30)) \item axis
#'   scales: xscale, yscale (e.g.: yscale = "log2") \item color palettes:
#'   palette = "Dark2" or palette = c("gray", "blue", "red") \item legend title,
#'   labels and position: legend = "right" \item plot orientation : orientation
#'   = c("vertical", "horizontal", "reverse") }
#' @seealso \code{\link{ggpar}}, \code{\link{ggline}}
#' @examples
#'
#' # Data: Create some data
#' # +++++++++++++++++++++++++++++++
#'
#' df <- data.frame(
#'  group = c("Male", "Female", "Child"),
#'   value = c(25, 25, 50))
#'
#' head(df)
#'
#'
#' # Basic pie charts
#' # ++++++++++++++++++++++++++++++++
#'
#' ggpie(df, "value", label = "group")
#'
#'
#' # Change color
#' # ++++++++++++++++++++++++++++++++
#'
#' # Change fill color by group
#' # set line color to white
#' # Use custom color palette
#'  ggpie(df, "value", label = "group",
#'       fill = "group", color = "white",
#'        palette = c("#00AFBB", "#E7B800", "#FC4E07") )
#'
#'
#' # Change label
#' # ++++++++++++++++++++++++++++++++
#'
#' # Show group names and value as labels
#' labs <- paste0(df$group, " (", df$value, "%)")
#' ggpie(df, "value", label = labs,
#'    fill = "group", color = "white",
#'    palette = c("#00AFBB", "#E7B800", "#FC4E07"))
#'
#' # Change the position and font color of labels
#' ggpie(df, "value", label = labs,
#'    lab.pos = "in", lab.font = "white",
#'    fill = "group", color = "white",
#'    palette = c("#00AFBB", "#E7B800", "#FC4E07"))
#'
#'
#'
#' @export
ggpie <- function(data, x, label = NULL, lab.pos = c("out", "in"),
                  lab.font = c(4, "bold", "black"),
                      color = "black", fill = "white", palette = NULL,
                      size = 1, ggtheme = theme_pubr(),
                      ...)
{

  lab.pos <- match.arg(lab.pos)
  lab.font <- .parse_font(lab.font)

  if(is.null(lab.font)) lab.font <- list(size = 5, face = "bold", color = "black")


  p <- ggplot(data, aes_string(x = 1, y = x))+
    .geom_exec(geom_bar, data,  stat = "identity", fill = fill, color = color, size = size)
  p <- ggpar(p, palette = palette, ggtheme = ggtheme, ...)

  p <- p + coord_polar(theta = "y", start = 0) +
    theme(
      axis.title = element_blank(),
      axis.text.y = element_blank(),
      axis.line = element_blank(),
      # panel.border = element_blank(),
      # panel.grid=element_blank(),
      axis.ticks = element_blank()
    )

  # label each slice at the midle of the slice
  if(!is.null(label)){
    if(label[1] %in% names(data)) label <- data[, label]

    if(lab.pos == "out"){
      p <- p + scale_y_continuous(
        breaks = cumsum(data[, x]) - data[, x]/2,
        labels = label
      )
    }
    if(lab.pos == "in"){
      df <- data
      y <- df[, x]
      df[, x] <- (y/length(y)) + c(0, cumsum(y)[-length(y)])
      lab.font$size <- ifelse(is.null(lab.font$size), 5, lab.font$size)
      lab.font$color <- ifelse(is.null(lab.font$color), "black", lab.font$color)
      lab.font$face <- ifelse(is.null(lab.font$ace), "bold", lab.font$face)
      p <- p + .geom_exec(geom_text, data = df, x = 1, y = x, label = label,
                          size = lab.font$size, fontface = lab.font$face, colour = lab.font$color
                          )+
        theme(
          axis.text.x = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks = element_blank())
    }

  }




  p
}

