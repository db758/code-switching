# Install script for directory: /Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Library/Developer/CommandLineTools/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kenlm/util" TYPE FILE FILES
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/bit_packing.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/ersatz_progress.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/exception.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/fake_ostream.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/file.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/file_piece.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/file_stream.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/fixed_array.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/float_to_string.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/getopt.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/have.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/integer_to_string.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/joint_sort.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/mmap.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/multi_intersection.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/murmur_hash.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/parallel_read.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/pcqueue.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/pool.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/probing_hash_table.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/proxy_iterator.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/read_compressed.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/scoped.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/sized_iterator.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/sorted_uniform.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/spaces.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/string_piece.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/string_piece_hash.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/string_stream.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/thread_pool.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/tokenize_piece.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/usage.hh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kenlm/util/double-conversion" TYPE FILE FILES
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/double-conversion/bignum-dtoa.h"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/double-conversion/bignum.h"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/double-conversion/cached-powers.h"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/double-conversion/diy-fp.h"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/double-conversion/double-conversion.h"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/double-conversion/fast-dtoa.h"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/double-conversion/fixed-dtoa.h"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/double-conversion/ieee.h"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/double-conversion/strtod.h"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/double-conversion/utils.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kenlm/util/stream" TYPE FILE FILES
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/stream/block.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/stream/chain.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/stream/config.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/stream/count_records.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/stream/io.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/stream/line_input.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/stream/multi_progress.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/stream/multi_stream.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/stream/rewindable_stream.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/stream/sort.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/stream/stream.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/util/stream/typed_stream.hh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kenlm/lm" TYPE FILE FILES
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/bhiksha.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/binary_format.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/blank.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/config.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/enumerate_vocab.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/facade.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/left.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/lm_exception.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/max_order.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/model.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/model_type.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/ngram_query.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/partial.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/quantize.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/read_arpa.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/return.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/search_hashed.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/search_trie.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/sizes.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/state.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/trie.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/trie_sort.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/value.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/value_build.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/virtual_interface.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/vocab.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/weights.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/word_index.hh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kenlm/lm/builder" TYPE FILE FILES
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/builder/adjust_counts.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/builder/combine_counts.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/builder/corpus_count.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/builder/debug_print.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/builder/discount.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/builder/hash_gamma.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/builder/header_info.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/builder/initial_probabilities.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/builder/interpolate.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/builder/output.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/builder/payload.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/builder/pipeline.hh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kenlm/lm/common" TYPE FILE FILES
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/common/compare.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/common/joint_order.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/common/model_buffer.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/common/ngram.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/common/ngram_stream.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/common/print.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/common/renumber.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/common/size_option.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/common/special.hh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kenlm/lm/filter" TYPE FILE FILES
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/filter/arpa_io.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/filter/count_io.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/filter/format.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/filter/phrase.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/filter/thread.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/filter/vocab.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/filter/wrapper.hh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kenlm/lm/interpolate" TYPE FILE FILES
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/interpolate/backoff_matrix.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/interpolate/backoff_reunification.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/interpolate/bounded_sequence_encoding.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/interpolate/interpolate_info.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/interpolate/merge_probabilities.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/interpolate/merge_vocab.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/interpolate/normalize.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/interpolate/pipeline.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/interpolate/split_worker.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/interpolate/tune_derivatives.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/interpolate/tune_instances.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/interpolate/tune_matrix.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/interpolate/tune_weights.hh"
    "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/lm/interpolate/universal_vocab.hh"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/build/util/cmake_install.cmake")
  include("/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/build/lm/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/Debasmita/Desktop/CodeSwitchingResearch/kenlm/kenlm/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
