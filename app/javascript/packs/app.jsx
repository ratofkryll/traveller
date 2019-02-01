import React, {Component} from 'react';
import ReactDOM from 'react-dom';
import ItineraryList from './ItineraryList.jsx'

export default class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      itinerary: null
    }
  }

  componentDidMount() {
    App.cable.subscriptions.create(
      { channel: "TripChannel" },
      {
        received: data => {
          this.setState({
            itinerary: data
          });
        },
        speak: function(data) {
          return this.perform("speak", data)
        }
      }
    )
  }

  render() {
    return (
      <ItineraryList itinerary={this.state.itinerary} />
    )
  }

}