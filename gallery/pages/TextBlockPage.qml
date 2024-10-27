import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Page {
    Column {
        anchors.centerIn: parent
        spacing: 10

        BaseControls.TextBlock {
            text: 'Example Body text block'
            typo: 'Body'
        }
        BaseControls.TextBlock {
            text: 'Example Subject text block'
            typo: 'Subject'
        }
        BaseControls.TextBlock {
            text: 'Example Header text block'
            typo: 'Header'
        }
        BaseControls.TextBlock {
            text: 'Example PaneHeader text block'
            typo: 'PaneHeader'
        }
        BaseControls.TextBlock {
            text: 'Example EmailHeader text block'
            typo: 'EmailHeader'
        }
        BaseControls.TextBlock {
            text: 'Example PageTitle text block'
            typo: 'PageTitle'
        }
        BaseControls.TextBlock {
            text: 'Example HeroTitle text block'
            typo: 'HeroTitle'
        }
        BaseControls.TextBlock {
            text: 'Example H1 text block'
            typo: 'H1'
        }
        BaseControls.TextBlock {
            text: 'Example H2 text block'
            typo: 'H2'
        }
        BaseControls.TextBlock {
            text: 'Example H3 text block'
            typo: 'H3'
        }
        BaseControls.TextBlock {
            text: 'Example H4 text block'
            typo: 'H4'
        }
        BaseControls.TextBlock {
            text: 'Example H5 text block'
            typo: 'H5'
        }
        BaseControls.TextBlock {
            text: 'Example H6 text block'
            typo: 'H6'
        }
    }
}
