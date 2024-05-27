cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  other-diseases-causing-hypoglycemia---primary:
    run: other-diseases-causing-hypoglycemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  corticoadrenal-diseases-causing-hypoglycemia---primary:
    run: corticoadrenal-diseases-causing-hypoglycemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: other-diseases-causing-hypoglycemia---primary/output
  diseases-causing-hypoglycemia-related---primary:
    run: diseases-causing-hypoglycemia-related---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: corticoadrenal-diseases-causing-hypoglycemia---primary/output
  intestinal-diseases-causing-hypoglycemia---primary:
    run: intestinal-diseases-causing-hypoglycemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: diseases-causing-hypoglycemia-related---primary/output
  diseases-causing-hypoglycemia-manifestation---primary:
    run: diseases-causing-hypoglycemia-manifestation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: intestinal-diseases-causing-hypoglycemia---primary/output
  diseases-causing-hypoglycemia-hypopituitarism---primary:
    run: diseases-causing-hypoglycemia-hypopituitarism---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: diseases-causing-hypoglycemia-manifestation---primary/output
  mpituitary-diseases-causing-hypoglycemia---primary:
    run: mpituitary-diseases-causing-hypoglycemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: diseases-causing-hypoglycemia-hypopituitarism---primary/output
  diseases-causing-hypoglycemia-minsulinoma---primary:
    run: diseases-causing-hypoglycemia-minsulinoma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: mpituitary-diseases-causing-hypoglycemia---primary/output
  diseases-causing-hypoglycemia-fibrosis---primary:
    run: diseases-causing-hypoglycemia-fibrosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: diseases-causing-hypoglycemia-minsulinoma---primary/output
  diseases-causing-hypoglycemia-meconium---primary:
    run: diseases-causing-hypoglycemia-meconium---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: diseases-causing-hypoglycemia-fibrosis---primary/output
  mpancreatic-diseases-causing-hypoglycemia---primary:
    run: mpancreatic-diseases-causing-hypoglycemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: diseases-causing-hypoglycemia-meconium---primary/output
  diseases-causing-hypoglycemia-pancreatitis---primary:
    run: diseases-causing-hypoglycemia-pancreatitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: mpancreatic-diseases-causing-hypoglycemia---primary/output
  diseases-causing-hypoglycemia-addisons---primary:
    run: diseases-causing-hypoglycemia-addisons---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: diseases-causing-hypoglycemia-pancreatitis---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: diseases-causing-hypoglycemia-addisons---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
