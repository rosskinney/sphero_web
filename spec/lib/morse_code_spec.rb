require 'spec_helper'

describe MorseCode do
  describe "#translate" do
    it "handles S" do
      expect(subject.translate('S')).to eq("...")
    end
    it "handles O" do
      expect(subject.translate('O')).to eq("---")
    end
    it "handles SOS" do
      expect(subject.translate('SOS')).to eq("... --- ...")
    end
    describe "letters" do
      {
          :a => '.-',
          :b => '-...',
          :c => '-.-.',
          :d => '-..',
          :e => '.',
          :f => '..-.',
          :g => '--.',
          :h => '....',
          :i => '..',
          :j => '.---',
          :k => '-.-',
          :l => '.-..',
          :m => '--',
          :n => '-.',
          :o => '---',
          :p => '.--.',
          :q => '--.-',
          :r => '.-.',
          :s => '...',
          :t => '-',
          :u => '..-',
          :v => '...-',
          :w => '.--',
          :x => '-..-',
          :y => '-.--',
          :z => '--..',
          :" " => ' '
      }.each do |letter, morse_code|
        it "handles #{letter.to_s.upcase}" do
          expect(subject.translate(letter.to_s.upcase)).to eq(morse_code)
        end
        it "handles #{letter.to_s}" do
          expect(subject.translate(letter.to_s)).to eq(morse_code)
        end
      end
      describe "numbers" do
        {
            '0' => '-----',
            '1' => '.----',
            '2' => '..---',
            '3' => '...--',
            '4' => '....-',
            '5' => '.....',
            '6' => '-....',
            '7' => '--...',
            '8' => '---..',
            '9' => '----.'
        }.each do |number, morse_code|
          it "handles #{number}" do
            expect(subject.translate(number)).to eq(morse_code)
          end
        end

      end
    end
    it "handles multiple words" do
      expected_morse_code = "..   .-.. --- ...- .   .--. .-. --- --. .-. .- -- -- .. -. --."
      expect(subject.translate("I love programming")).to eq(expected_morse_code)
    end
  end
end