<!-- Format of this CHANGELOG is inspired by 
  https://keepachangelog.com/de/0.3.0/ and 
  https://gist.github.com/juampynr/4c18214a8eb554084e21d6e288a18a2c 
-->

# Change Log
All notable changes to this project will be documented in this file.  
It's a team effort to make this documentation as straightforward as possible. 

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project ~~adheres to~~ is inspired by [Semantic Versioning](http://semver.org/) since V3.1.

 
## [Unreleased / to become 3.1.1] - 2021-11-dd
 
### Added
- some paragraphs to section _5.2.2	Finite Element Specific Data `<femdata/>`_ 
  &mdash; addresses issue [#52](https://github.com/economidis-nick/createXSDforxMCF/issues/52).
- new section _5.2.2.1	Reasoning about `<femdata/>`_ 
  &mdash; addresses issue [#52](https://github.com/economidis-nick/createXSDforxMCF/issues/52).
- new section _8.1.2.1	Intermittent Connection Lines_ with according example &chi;MCF files. 
  &mdash; addresses issue [#53](https://github.com/economidis-nick/createXSDforxMCF/issues/53).
- new section _8.2.2 Attribute ident_ with according example.
  &mdash; addresses issue [#65](https://github.com/economidis-nick/createXSDforxMCF/issues/65).

### Changed
- Small insertion, addressing issue [#55](https://github.com/economidis-nick/createXSDforxMCF/issues/55)
- Spec re-formatted according to ISO requirements [#63](https://github.com/economidis-nick/createXSDforxMCF/issues/63) (2021-09-02)
- <normal_direction> and <tangential_direction> are now allowed in every <connection_0d>, addressing issue [#64](https://github.com/economidis-nick/createXSDforxMCF/issues/64)
- &hellip;

### Fixed
- Issue [#49](https://github.com/economidis-nick/createXSDforxMCF/issues/49)
- Issue [#56](https://github.com/economidis-nick/createXSDforxMCF/issues/56)
- Issue [#48](https://github.com/economidis-nick/createXSDforxMCF/issues/48)
- &hellip;


## [3.1] - 2020-06-19
Official release to be found at VDA Server as ["&chi;MCF &ndash; A Standard for Describing Connections & Joints in Mechanical Structures (Version 3.1)"](https://en.vda.de/en/services/Publications/xmcf.html).

### Added
- Connection types: 
	- Clinch Rivet Stud, 
	- ROTAV Element
- Schema file xmcf_3_1_0.xsd
- Example &chi;MCF files for testing - incl. counter-examples.
- Decisions and agreements from Working Group meetings May 2019 & May 2020.

### Changed
- Re-Use of [FATXML](https://www.vda.de/vda/de/aktuelles/publikationen/publication/fatxml-format-version-v1.2) element in &chi;MCF's `<femdata/>` element.

<!--
### Fixed
 -->

 
## [3.0] - 2016-05-19
Official release to be found at VDA Server as ["FAT-Schriftenreihe 286"](https://en.vda.de/en/services/Publications/fat-schriftenreihe-286.html).

### Added
- Connection types: 
	- Blind and solid rivets
	- Flow drilled screws
	- Clinches
	- Heat stakes
	- Clips / snap joints
	- Nails
- New sections:
	- _6.5 Distinction between `<custom_attributes_list/>` and `<appdata/>`_
- Working Group feedback Nov. 2015 &ndash; Jan. 2016.
   
<!--
### Changed
-->

<!--
### Fixed
 -->
