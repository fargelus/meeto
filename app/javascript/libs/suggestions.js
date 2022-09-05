import 'suggestions-jquery'
import jquery from 'jquery'

jquery('#addr-suggestions').suggestions(
    {
        token: '8aaa545393f936c8af2610ff822e20e9c7671b26',
        type: 'ADDRESS',
        triggerSelectOnBlur: true,
        onSelect: (suggestion) => {
            const {geo_lat, geo_lon} = suggestion.data;
            $('#addr-lat').val(geo_lat);
            $('#addr-long').val(geo_lon);
        }
    }
)
