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

 <table border="1">
  <tr>
    <th bgcolor="yellow">Announcement</th>
  </tr>
  <tr>
    <td align="center" bgcolor="yellow">
	  The next meeting of the VDA FAT AK 25 &chi;MCF / ISO/PAS 8329 working group 
	  is scheduled for <br/> <br/>
	  <strong>Wed., January&nbsp;14,&nbsp;2026 15:00&ndash;16:00 CET</strong> <br/>
	  via Microsoft Teams&trade;. <br/>
  <!--
	  <a href="https://teams.microsoft.com/l/meetup-join/19%3ameeting_N2U4NzM1MDAtNWFkNC00NzAzLTk0ODgtMDBjYzE1YWE0Yzg5%40thread.v2/0?context=%7b%22Tid%22%3a%22c990bb7a-51f4-439b-bd36-9c07fb1041c0%22%2c%22Oid%22%3a%22c43a17ef-8a9e-4c56-954e-97e492c7d670%22%7d">
	  <b>Join the meeting via this link!</b></a>
  -->
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

The most recent meeting of the VDA FAT AK 25 &chi;MCF / ISO/PAS 8329 working group took place online, December&nbsp;10,&nbsp;2025.  
Minutes are stored in directory [2025-12-10_VideoConference](./VDA_FAT_AK_25/Meetings/2025-12-10_VideoConference).  

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
