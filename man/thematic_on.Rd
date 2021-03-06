% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/thematic.R
\name{thematic_on}
\alias{thematic_on}
\alias{thematic_off}
\alias{thematic_theme}
\alias{thematic_shiny}
\alias{thematic_rmd}
\title{Enable (or disable) simplified theming of R graphics.}
\usage{
thematic_on(
  bg = "auto",
  fg = "auto",
  accent = "auto",
  font = NA,
  sequential = sequential_gradient(),
  qualitative = okabe_ito(),
  inherit = FALSE
)

thematic_off()

thematic_theme(
  bg = "auto",
  fg = "auto",
  accent = "auto",
  font = NA,
  sequential = sequential_gradient(),
  qualitative = okabe_ito(),
  inherit = FALSE
)

thematic_shiny(
  bg = "auto",
  fg = "auto",
  accent = "auto",
  font = NA,
  sequential = sequential_gradient(),
  qualitative = okabe_ito(),
  inherit = FALSE,
  session = shiny::getDefaultReactiveDomain()
)

thematic_rmd(
  bg = "auto",
  fg = "auto",
  accent = "auto",
  font = NA,
  sequential = sequential_gradient(),
  qualitative = okabe_ito(),
  inherit = FALSE
)
}
\arguments{
\item{bg}{a background color.}

\item{fg}{a foreground color.}

\item{accent}{a color for making certain graphical markers 'stand out'
(e.g., the fitted line color for \code{\link[ggplot2:geom_smooth]{ggplot2::geom_smooth()}}).
Can be 2 colors for lattice (stroke vs fill accent).}

\item{font}{a \code{\link[=font_spec]{font_spec()}} object. If missing, font defaults are not altered.}

\item{sequential}{a color palette for graphical markers that encode
numeric values. Can be a vector of color codes or a
\code{\link[=sequential_gradient]{sequential_gradient()}} object.}

\item{qualitative}{a color palette for graphical markers that encode
qualitative values (won't be used in ggplot2 when the number of data
levels exceeds the max allowed colors). Defaults to \code{\link[=okabe_ito]{okabe_ito()}}.}

\item{inherit}{should non-specified values inherit from the previous theme?}

\item{session}{see \code{\link[shiny:onStop]{shiny::onStop()}}.}
}
\value{
\code{\link[=thematic_theme]{thematic_theme()}} returns a theme object as a list (which can be
activated with \code{\link[=thematic_with_theme]{thematic_with_theme()}} or \code{\link[=thematic_set_theme]{thematic_set_theme()}}).

\code{\link[=thematic_on]{thematic_on()}}, \code{\link[=thematic_off]{thematic_off()}}, and \code{\link[=thematic_shiny]{thematic_shiny()}} all return
the previous global theme.
}
\description{
A unified interface for theming \strong{ggplot2}, \strong{base}, and \strong{lattice} graphics
based on a handful of styling options. In some cases (most notably in a \strong{shiny} runtime),
these options can automatically resolve to relevant CSS styles (see the "Auto theming"
section below).
}
\section{Auto theming}{


The \code{bg}, \code{fg}, \code{accent}, and \code{font} arguments all support a value of \code{'auto'},
which are all resolved, at plot time, based on the execution environment. In a
\strong{shiny} runtime, resolution of auto values should always work as expect; but
in other contexts, auto values may lead to wrong or surprising results. In that
case, auto resolution logic can be customized (see \code{\link[=auto_config_set]{auto_config_set()}} for more details).
}

\section{Global vs. local theming}{


\code{thematic_on()} enables thematic in a global fashion (that is, it impacts all
future plots, up until \code{thematic_off()} is called). To use thematic in local fashion,
first create a theme with \code{\link[=thematic_theme]{thematic_theme()}}, then provide it to \code{\link[=thematic_with_theme]{thematic_with_theme()}}
(or similar). To use thematic in a global fashion up until a \strong{shiny}
app exits, use \code{thematic_shiny()} (which cleans up after itself once the next shiny
app that exits using \code{\link[shiny:onStop]{shiny::onStop()}}). To use thematic in a global fashion up until
a \strong{rmarkdown} document finishes rendering, use \code{thematic_rmd()}.
}

\section{Color values}{


Colors (e.g., \code{bg}, \code{fg}, \code{accent}) may be any value understood by \code{\link[=col2rgb]{col2rgb()}}
or \code{htmltools::parseCssColors()} (i.e., may be any valid R or CSS color string).
}

\examples{
# simple dark mode
thematic_on("black", "white")
plot(1:10)
plot(1:10, col = 1:10)
lattice::show.settings()

# use any hex color string
thematic_on("#444444", "#e4e4e4")
plot(1:10)
plot(1:10, col = 1:10)
lattice::show.settings()

# disables thematic (also restores global state)
thematic_off()
plot(1:10)
lattice::show.settings()

thematic_on("darkblue", "skyblue", "orange")
image(volcano)
image(volcano, col = thematic_get_option("sequential"))
lattice::show.settings()
thematic_off()

}
\seealso{
\code{\link[=sequential_gradient]{sequential_gradient()}}, \code{\link[=thematic_with_theme]{thematic_with_theme()}}, \code{\link[=thematic_save_plot]{thematic_save_plot()}}
}
