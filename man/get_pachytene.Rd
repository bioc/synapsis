% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_pachytene.R
\name{get_pachytene}
\alias{get_pachytene}
\title{get_pachytene}
\usage{
get_pachytene(
  img_path,
  species_num = 20,
  offset = 0.2,
  ecc_thresh = 0.85,
  area_thresh = 0.06,
  annotation = "off",
  channel2_string = "SYCP3",
  channel1_string = "MLH3",
  file_ext = "jpeg",
  KO_str = "--",
  WT_str = "++",
  KO_out = "-/-",
  WT_out = "+/+",
  path_out = img_path,
  artificial_amp_factor = 3,
  strand_amp = 2,
  resize_l = 120
)
}
\arguments{
\item{img_path, }{path containing crops analyse}

\item{species_num, }{number of chromosomes in the species}

\item{offset, }{Pixel value offset used in therholding for the synaptonemal complex (SYCP3) channel}

\item{ecc_thresh, }{The minimum average eccentricity of all objects in mask determined by computefeatures, for a cell to be pachytene.}

\item{area_thresh, }{The minimum ratio of pixels included in mask to total, for a cell to be classified as pachytene.}

\item{annotation, }{Choice to output pipeline choices (recommended to knit)}

\item{channel2_string}{String appended to the files showing the channel illuminating synaptonemal complexes. Defaults to SYCP3}

\item{channel1_string}{String appended to the files showing the channel illuminating foci. Defaults to MLH3}

\item{file_ext}{file extension of your images e.g. tiff jpeg or png.}

\item{KO_str}{string in filename corresponding to knockout genotype. Defaults to --.}

\item{WT_str}{string in filename corresponding to wildtype genotype. Defaults to ++.}

\item{KO_out}{string in output csv in genotype column, for knockout. Defaults to -/-.}

\item{WT_out}{string in output csv in genotype column, for knockout. Defaults to +/+.}

\item{path_out, }{user specified output path. Defaults to img_path}

\item{artificial_amp_factor}{Amplification of foci channel, for RGB output files. Deaults to 3.}

\item{strand_amp}{multiplication of strand channel.}

\item{resize_l}{length of resized square cell image.}
}
\value{
Pairs of foci and synaptonemal channel crops for pachytene
}
\description{
Identifies crops in pachytene
}
\details{
This function takes the crops make by auto_crop fast, and determines the
number of synaptonemal complex candidates by considering the local background
and using EBImage functions. In general, very bright objects which contrast
highly with the background will be classified as the same object. Dim objects
will likely be classified as many different objects. If the number of objects
is too high compared to the species number (species_num) then the cell is
determined to not be in pachytene. Note that this function has been optimized
for mouse cells which can be very well spread / separated.
}
\examples{
demo_path = paste0(system.file("extdata",package = "synapsis"))
SYCP3_stats <- get_pachytene(demo_path,ecc_thresh = 0.8, area_thresh = 0.04, annotation = "on")
}
\author{
Lucy McNeill
}
