# &chi;MCF (aka xMCF)

&chi;MCF stands for "extended Master Connection File", a standard for files describing connections of mechanical parts for automotive and similar industries. 
The project has been initiated by [VDA](https://www.vda.de/en), the German Association of the Automotive Industry

The **&chi;MCF 3.0** format specification has been described in text, without a schema. 
The following version **&chi;MCF 3.1** features an XML schema and some improvements.

We have made slight corrections to the original document, and 
we are developing the schema, as well as [complete examples](./V3.1.1/examples) to accompany the documentation.

In order for us to test-drive the development of the [schema](./V3.1.1/xmcf_3_1_1.xsd), 
we have built a [test suite](./V3.1.1/test_suite).

With version **&chi;MCF 3.1.1**, we achieved ISO standardization in Aug. 2024, see [ISO/PAS 8329](https://www.iso.org/standard/83119.html).

With version **&chi;MCF 3.2**, we currently work on _catalogs_ aka. _templates_ and more minor features, 
see content of milestone [Release V3.2](https://github.com/economidis-nick/createXSDforxMCF/milestone/4).

 <table border="1">
  <tr>
    <th bgcolor="yellow">Announcement</th>
  </tr>
  <tr>
    <td align="center" bgcolor="yellow">
	  The next meeting(s) of the VDA FAT AK 25 &chi;MCF / ISO/PAS 8329 working group 
	  is/are scheduled for <br/> <br/>
	  <strong>Wed., May&nbsp;20,&nbsp;2026 15:00&ndash;16:00 CEST</strong> (technical focus group) <!--(full group)--> <br/><!--
	  and <br/>
	  <strong>Wed., January&nbsp;28,&nbsp;2026 15:00&ndash;16:00 CET</strong> (full group) <br/>-->
	  via Microsoft Teams&trade;. <br/>
	  <!-- <em>Special guest today: AFNeT Services, providing an introduction to Schematron verification for XML files</em><br/> -->
	  <a href="https://teams.microsoft.com/l/meetup-join/19%3ameeting_OGM2M2NiNGUtMmYyYi00NTAxLWJlOWUtNGJiYzhmZWJmMTRj%40thread.v2/0?context=%7b%22Tid%22%3a%22cd62a082-2dff-4531-9639-704a86053b5c%22%2c%22Oid%22%3a%22d63d16ce-f5c2-43f0-86fc-79cd9c3b38d7%22%7d">
	  <b>Join the meeting via this link!</b></a>
	</td>
  </tr>
  <tr>
    <td align="center" bgcolor="yellow">
	  Find more details  
	  <a href="https://github.com/economidis-nick/createXSDforxMCF/blob/master/VDA_FAT_AK_25/Meetings/2026-05-20_VideoConference/README.md"><b>here</b></a><!--
	  and
	  <a href="https://github.com/economidis-nick/createXSDforxMCF/blob/master/VDA_FAT_AK_25/Meetings/2026-05-20_VideoConference/README.md"><b>here</b></a>-->.
	</td>
  </tr>
  <!--
  <tr>
    <td align="center">
	  Please <b>answer the survey</b> about the priorities of our next actions at <br/>
	  <b><a href="https://dud-poll.inf.tu-dresden.de/xMCF/">&chi;MCF Open Issues Prioritization</a></b>!
	</td>
  </tr>
  -->
</table> 
<!--
-->

<hr/>

The most recent meeting of the VDA FAT AK 25 &chi;MCF / ISO/PAS 8329 working group took place online, Apr.&nbsp;01,&nbsp;2026.  
Minutes are stored in directory [2026-04-01_VideoConference](./VDA_FAT_AK_25/Meetings/2026-04-01_VideoConference).  

<hr/>

## Folder Contents

#### `V3.0/` contains:
the original specification document and pdf

#### `V3.1/` contains:
* the corrected specification document, 
* the developed &chi;MCF3.1 schema,
* the accompanying examples for the updated document, and
* a `test_suite` used for test-driven development of the schema

#### `V3.1.1/` contains:
* the improved specification document V3.1.1, 
* the improved &chi;MCF3.1.1 schema, and
* the accompanying examples for the updated document
* a `test_suite` used for test-driven development of the schema

#### `ISO PAS 8329/` contains:
* the source for the officially published ISO standard, 
  which is &chi;MCF3.1.1, with some occasional minor bug fixes.
* referring to the artefacts (graphics, examples, test cases) of &chi;MCF3.1.1.

#### `VDA_FAT_AK_25/` contains:
* external presentations of &chi;MCF, e.g. at conferences, 
* additional helpful material, *not* used by the official standard document, and
* minutes and attachments from working group meetings.
