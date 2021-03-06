Introdução

O crescente avanço tecnológico e o desenvolvimento da internet, provocou um aumento no número de aplicações ou serviços que dependem da infraestrutura de TI. Além disso, percebe-se um aumento significativo no número de operações e negócios onlines que são realizados, tanto por organizações públicas ou privadas, quanto por grande parte da sociedade.
Desta forma, a sociedade está cada vez mais dependente da tecnologia, computadores e sistemas. De fato, pode-se observar sistemas computacionais desde em uma farmácia, até em uma grande indústria. Sendo assim, a estabilidade e confiabilidade destes sistemas tem grande importância em nosso dia-a-dia, pois inúmeras atividades dependem destes.
Uma interrupção imprevista em um ambiente computacional poderá causar um prejuízo financeiro para a empresa que fornece o serviço, além de interferir na vida de pessoas que dependem de forma direta ou indireta deste serviço. Essa interrupção terá maior relevância para corporações cujo o serviço ou produto final é fornecido através da internet, como por exemplo, comércio eletrônico, web sites, sistemas corporativos, entre outros. Em um ambiente extremo, pode-se imaginar o caos e o possível risco de perda de vidas que ocorreria em caso de uma falha em algum sistema de controle aéreo (COSTA, 2009).
Para essas empresas um plano de contingência é fundamental para garantir uma boa qualidade de serviço, bem como para uma prevenção a falhas e uma recuperação rápida caso essas ocorram. De fato, hoje em dia a confiabilidade de um serviço ou de um sistema é um grande diferencial para a empresa fornecedora deste serviço, sendo que a alta disponibilidade é fundamental para atingir esse objetivo.
A alta disponibilidade consiste em manter um sistema disponível utilizando mecanismos que fazem a detecção, mascaramento e a recuperação de falhas, sendo que esses mecanismos podem ser implementados a nível de software ou de hardware (REIS, 2009). A finalidade da alta disponibilidade é garantir que um serviço permaneça o maior tempo possível disponível (GONÇALVES, 2009). Para isso é necessário que o sistema seja tolerante a falhas, ou seja, que ele consiga mascarar a presença de falhas usando redundância.
Neste trabalho será realizado um estudo sobre a implementação de um sistema de alta disponibilidade em uma empresa de hospedagens. Essa oferece serviços pela internet, como por exemplo hospedagens de sites, e-mail, sistemas de gestão, e-mail marketing, entre outros. Essa empresa possui aproximadamente 55 servidores e aproximadamente 9000 clientes, sendo que em períodos de pico atende em torno de 1000 requisições por segundo. 
Atualmente essa empresa possui somente redundância de refrigeração e energia, com nobreaks e geradores. Além disso, a empresa possui redundância nos links de acesso a internet. Porém, essa empresa não possui nenhuma redundância dos serviços alocados nos servidores. Desta forma, caso ocorra uma falha de software ou hardware os serviços ficarão indisponíveis. Neste trabalho será realizada uma análise dos serviços oferecidos pela empresa, sendo que mecanismos de alta disponibilidade serão desenvolvidos para os serviços mais críticos. Para a redução dos custos serão utilizadas ferramentas gratuitas e de código aberto.

Questão de pesquisa

Como garantir uma alta disponibilidade utilizando ferramentas gratuitas e de código aberto?

Objetivos

Atualmente a empresa a ser estudada não possui nenhuma solução de alta disponibilidade para seus serviços críticos. Desta forma, neste trabalho será desenvolvida uma solução de alta disponibilidade para estes serviços, sendo que essa solução será baseada no uso de ferramentas de código aberto e de baixo custo.
Para que o objetivo geral seja atendido os seguintes objetivos específicos deverão ser realizados:
Identificar os serviços críticos a serem integrados ao ambiente de alta disponibilidade;
Definir as ferramentas a serem utilizadas para implementar tolerância a falhas;
Realizar testes para a validação do sistema de alta disponibilidade que foi desenvolvido.

Metodologia

Inicialmente será feito um estudo bibliográfico sobre alta disponibilidade e de ferramentas de código aberto, com isso pretende-se atingir um nível de conhecimento suficiente para que seja possível fazer a implementação da solução proposta.
Posteriormente, será realizada uma análise do ambiente atual da empresa, com levantamento de informações sobre hardware e software. A partir dessa análise pretende-se identificar os serviços críticos, que serão devidamente transferidos para um ambiente de alta disponibilidade.
Por fim, será desenvolvido um ambiente para homologação e testes. Para a criação dessa solução será utilizado ferramentas de código aberto. E então será feito uma análise dos resultados para a elaboração da conclusão.

