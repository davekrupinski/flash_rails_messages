require 'spec_helper'

RSpec.describe FlashRailsMessages::Helper do
  let(:subject) do
    ActionView::Base.new(
      ActionView::LookupContext.new([]),
      {},
      nil
    )
  end

  describe '#render_flash_messages' do
    context 'when flash does not have messages' do
      it 'returns nothing' do
        allow(subject).to receive(:flash).and_return({})
        expect(subject.render_flash_messages).to eql('')
      end
    end

    context 'when flash has messages' do
      context 'when flash type is notice' do
        it 'returns the correct message' do
          allow(subject).to receive(:flash).and_return({ notice: 'message' })
          alert_expected = alert_element('message', class: 'alert')
          expect(subject.render_flash_messages).to eql(alert_expected)
        end
      end

      context 'when flash type is success' do
        it 'returns the correct message' do
          allow(subject).to receive(:flash).and_return({ success: 'message' })
          alert_expected = alert_element('message', class: 'alert')
          expect(subject.render_flash_messages).to eql(alert_expected)
        end
      end

      context 'when flash type is alert' do
        it 'returns the correct message' do
          allow(subject).to receive(:flash).and_return({ alert: 'message' })
          alert_expected = alert_element('message', class: 'alert')
          expect(subject.render_flash_messages).to eql(alert_expected)
        end
      end

      context 'when flash type is error' do
        it 'returns the correct message' do
          allow(subject).to receive(:flash).and_return({ error: 'message' })
          alert_expected = alert_element('message', class: 'alert')
          expect(subject.render_flash_messages).to eql(alert_expected)
        end
      end

      context 'when has more than one message' do
        it 'returns all the correct messages' do
          allow(subject).to receive(:flash).and_return({ alert: 'message1', notice: 'message2' })
          alerts_expected = alert_element('message1', class: 'alert') +
                            alert_element('message2', class: 'alert')
          expect(subject.render_flash_messages).to eql(alerts_expected)
        end
      end

      context 'with dismissible option' do
        it 'returns the correct message' do
          allow(subject).to receive(:flash).and_return({ notice: 'message' })
          alert_expected = alert_dismissible_element('message', class: 'alert')
          expect(subject.render_flash_messages(dismissible: true)).to eql(alert_expected)
        end
      end

      context 'with other options' do
        it 'returns the correct message' do
          allow(subject).to receive(:flash).and_return({ notice: 'message' })
          alert_expected = alert_element('message', id: 'alert-id', class: 'alert alert-class')
          expect(subject.render_flash_messages(id: 'alert-id', class: 'alert-class')).to eql(alert_expected)
        end
      end
    end
  end

  def alert_element(message, options = {})
    subject.content_tag(:div, message.html_safe, options)
  end

  def alert_dismissible_element(message, options = {})
    subject.content_tag(:div, close_element + message.html_safe, options)
  end

  def close_element
    subject.content_tag(:a, '&times;'.html_safe, class: 'close', href: '#')
  end
end
