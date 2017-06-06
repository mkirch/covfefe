#' @title Covfefy any word.
#'
#' @description
#' We can't all be the Cheeto in Chief, so we need this function to ensure
#' that we have the best words. This function takes a word, and performs the
#'  following algorithm thanks to
#'  \href{https://codegolf.stackexchange.com/questions/123685/covfefify-a-string}{
#'  this codegolf thread}:
#'
#' 1. Include all characters up through the first vowel in the word. (co)
#'
#' 2. Identifies the next consonant after the first vowel in the word. (v)
#'
#' 3. Changes that consonant to a phonetically similar consonant. (f)
#'
#' 4. Finds the next vowel after that consonant. (e)
#'
#' 5. Combines the two, and repeats. (fefe)
#'
#' 6. Puts it all together: covfefe
#' @param str Character string of word to covfefy. Defaults to "coverage".
#' @examples
#' covfefy("coverage")
#' covfefy("mexicans")
#' covfefy("wall")
#' covfefy("president")
#' covfefy("programming")
#' @export
covfefy <- function(str = "coverage"){
  result = tryCatch({
    first <- regmatches(str, regexpr("[^aeiouy]*[aeiouy]*", str))
    second <- regmatches(str, regexpr("[^aeiouy]*[aeiouy]*[^aeiouy]", str))
    second <- substr(second, nchar(second), nchar(second))
    if(grepl(second,"bcdfghjklmnpqrstvwxz")) {
      third <- regmatches("pgtvkhjglmnbqrzdfwxs",
                          regexpr(second, "bcdfghjklmnpqrstvwxz"))
    } else {
      third <- regmatches("bcdfghjklmnpqrstvwxz",
                          regexpr(second, "pgtvkhjglmnbqrzdfwxs"))
    }
    fourth <- regmatches(str, regexpr("[^aeiouy]*[aeiouy]*[^aeiouy]*[aeiouy]",
                         str))
    fourth <- substr(fourth, nchar(fourth), nchar(fourth))
    paste0(first,second, third, fourth, third, fourth)
  }, error = function(e) {
    str
  })
  result
}

#' @title Covfefy any sentence.
#'
#' @description
#' Calls \code{covfefy()} and uses rules to decide which, if any, word is
#' covfefefied.

#' @param sent Character string of sentence to covfefy. Defaults to
#' the famous tweet.
#' @param endSentence Boolean where TRUE forces use of punctuation.
#' @examples
#' covfefySentence(paste0("Despite the constant negative press coverage,",
#'                        "we are going to Make America Great Again"))
#' @export
covfefySentence <- function(sent= paste0("Despite the constant negative",
                                           " press coverage we are going ",
                                           "to Make America Great Again"),
                              endSentence = TRUE){
  wordVec <- strsplit(sent, "[[:space:]]|(?=[,.!?])", perl=TRUE)[[1]]
  punc <- wordVec[length(wordVec)]
  if(length(wordVec) < 10){
    return(sent)
  } else {
    # If sentence contains comma break sentence and covefefy.
    if(any(grepl(",",wordVec))){
      beforeComma <- (grep(",",wordVec)-1)[1]
      wordVec[beforeComma] <- covfefy(wordVec[beforeComma])
      wordVec <- wordVec[1:beforeComma]
    } else { # If sentence has no comma
      wordIdx <- round(length(wordVec)*.75)
      wordVec[wordIdx] <- covfefy(wordVec[wordIdx])
      wordVec <- wordVec[1:wordIdx]
    }
    if(endSentence & regexpr("[?.!]",punc)>0){
      return(paste(paste(wordVec,sep=" ",collapse = " "),punc,sep=""))
    } else {
      return(paste(wordVec,sep=" ",collapse = " "))
    }
  }
}

#' @title Covfefy any speech.
#'
#' @description
#' Calls \code{covfefySentences()} and uses rules to decide which,
#' if any, sentences are covfefefied.

#' @param text Location of input .txt file.
#' @param out Location of output .txt file.
#' @import tokenizers
#' @examples
#' covfefySpeech()
#' @export
covfefySpeech <- function(text = system.file("extdata", "inauguration.txt",
                                               package="covfefe"),
                            out = "covfefe_inauguration.txt"){
  text <- readChar(text, file.info(text)$size)
  paras <- tokenize_paragraphs(text)
  for (i in seq_along(paras[[1]])){
    sents <- tokenize_sentences(paras[[1]][i])
    newsents <- c()
    for (j in seq_along(sents[[1]])){
      newsents <- c(newsents,covfefySentence(sents[[1]][j],endSentence = TRUE))
    }
    paras[[1]][i] <- paste(newsents,sep = " ", collapse = " ")
  }
  text <- paste(paras[[1]], sep = "\n\n", collapse = "\n\n")
  con <- file(out, "wb")
  writeChar(text, con)
  close(con)
  return(text)
}
