<sch:schema
    xmlns:sch="http://purl.oclc.org/dsdl/schematron"
    queryBinding="xslt2">


		<sch:pattern id="connection-inherits-prototype-kind">

		  <!-- single point of truth -->
		  <sch:let name="connectionKinds"
				   value="('spotweld', 'gumdrop', 'rivet')"/>

		  <sch:rule context="xmcf/connection_group/connection_list/connection_0d[@template_label]">
		  
		  

			<sch:let name="proto"
					 value="root(.)/xmcf/connection_templates/connection_0d[@label = current()/@template_label][1]"/>

			<sch:let name="protoKind"
					 value="$proto/*[local-name() = $connectionKinds][1]"/>

			<sch:let name="connKind"
					 value="*[local-name() = $connectionKinds][1]"/>

			<sch:assert
			  test="empty($protoKind)
					or empty($connKind)
					or node-name($protoKind) = node-name($connKind)">
			  connection_0d references prototype "<sch:value-of select="@template_label"/>"
			  with type <sch:value-of select="name($protoKind)"/>,
			  but overrides it with <sch:value-of select="name($connKind)"/>.
			</sch:assert>

		  </sch:rule>
		</sch:pattern>

</sch:schema>