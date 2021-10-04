Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063674211EB
	for <lists+linux-clk@lfdr.de>; Mon,  4 Oct 2021 16:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbhJDOuc (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 4 Oct 2021 10:50:32 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:44290
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235080AbhJDOuc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Oct 2021 10:50:32 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2ED9540314
        for <linux-clk@vger.kernel.org>; Mon,  4 Oct 2021 14:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633358922;
        bh=w+sL+FQVIvgTC5iFf3ebFDfQJjEOqOG++9iuOMLzY6A=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=fJ7GuXJ8lAyvVdF5A55hEHArqvRi66LJ2zvwsfqpvuZ7gZgsNibKzP48zxDvo+6eh
         m8BBb+DiE1B+tbEQHxyKN7vAzLBabI8XPLq57u4U13J+rChmD0u/EN2W4/vIrMWcgz
         47RSDDhWd7iauj+bCiByafafUX4XUIyWMhGUNV4uu/MrJiqDuqssPkZoQbneCAvA/e
         vvKk7df5/ZwFVOiR7qBuy9T8uZgBLvivSn5tJzyTOFjiTGkuIEinkrRaG4q+Pn4ZLE
         nruIb/IbvvH+ftqtzFPMEb9bwW0OUaK7hTIIujzt/C+s7v2QfdUp5JKS5Jkjr0k/fj
         fzKakLrbBeWBA==
Received: by mail-lf1-f69.google.com with SMTP id t14-20020ac24c0e000000b003fd392f9a5eso1851687lfq.13
        for <linux-clk@vger.kernel.org>; Mon, 04 Oct 2021 07:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w+sL+FQVIvgTC5iFf3ebFDfQJjEOqOG++9iuOMLzY6A=;
        b=lPxGMJjKBxWLY10JD7rb/f4140B0n4JSAUz7oJXsa2yP9t4VMAYFRXt/E25075UKP1
         KctJaiApxsuqzFNE12zakj6JhbFhzlUHuA5LBTB+qB2uZWYfbGxgqGxkhm+iblin+LoP
         fjIoGuDn8UEfgCd2dmZIYJeKHQC8ynVfNo+/msRHtSmOSmNfk7i8RiwMw0B8/sUHydNA
         08XP4Q3+IMu2HbvKNF8jLo98DnUnGsx5r8tYlcRvqam5xcpOx4IO5XqpEsPwURLTK5aG
         bCwkT1zzuknSdwmSxVa8TqCt+OMbdaREDIKzWeISIdQfw857kArn+/zIoJztM9DkJOxL
         hRsg==
X-Gm-Message-State: AOAM530ozbfCY07XUm0IljqFVb+0ylg3f4oLTyr4Zcqj4fazTcUiqFXJ
        8IUF9LBhUSFFfmlC7r/Q+h3zkMuiUKG6EwMKuFbPbqna/RSWlosbHhiFGQZ/jq0j9aTwHsvSmhn
        8g1lps7T5t8KUuaM32niCaKghNlKoCwKNouxc9Q==
X-Received: by 2002:a2e:b172:: with SMTP id a18mr16093349ljm.37.1633358921504;
        Mon, 04 Oct 2021 07:48:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb5tinkZwMu1evfFdL+ihYVyTUQWNnEDS58h7J+qMSOrzZ3mWX2bIzCYTinylCv1rYj7dysA==
X-Received: by 2002:a2e:b172:: with SMTP id a18mr16093332ljm.37.1633358921266;
        Mon, 04 Oct 2021 07:48:41 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id j20sm411976lfb.85.2021.10.04.07.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 07:48:40 -0700 (PDT)
Subject: Re: [PATCH v2 06/10] regulator: dt-bindings: samsung,s5m8767: convert
 to dtschema
To:     Rob Herring <robh@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
 <20211001094106.52412-7-krzysztof.kozlowski@canonical.com>
 <YVsSfSBeAZ8DFYfH@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <cdcd4eda-a7a9-2aa2-1316-e7184ff30bf3@canonical.com>
Date:   Mon, 4 Oct 2021 16:48:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVsSfSBeAZ8DFYfH@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/10/2021 16:41, Rob Herring wrote:
> On Fri, Oct 01, 2021 at 11:41:02AM +0200, Krzysztof Kozlowski wrote:
>> Convert the regulators of Samsung S5M8767 PMIC to DT schema format.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../bindings/regulator/samsung,s5m8767.txt    | 140 ------------------
>>  .../bindings/regulator/samsung,s5m8767.yaml   |  83 +++++++++++
>>  MAINTAINERS                                   |   2 +-
>>  3 files changed, 84 insertions(+), 141 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
>>  create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
>> deleted file mode 100644
>> index 6cd83d920155..000000000000
>> --- a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
>> +++ /dev/null
>> @@ -1,140 +0,0 @@
>> -Binding for Samsung S5M8767 regulator block
>> -===========================================
>> -
>> -This is a part of device tree bindings for S5M family multi-function devices.
>> -More information can be found in bindings/mfd/sec-core.txt file.
>> -
>> -The S5M8767 device provide buck and LDO regulators.
>> -
>> -To register these with regulator framework instantiate under main device node
>> -a sub-node named "regulators" with more sub-nodes for each regulator using the
>> -common regulator binding documented in:
>> - - Documentation/devicetree/bindings/regulator/regulator.txt
>> -
>> -
>> -Required properties of the main device node (the parent!):
>> - - s5m8767,pmic-buck-ds-gpios: GPIO specifiers for three host gpio's used
>> -   for selecting GPIO DVS lines. It is one-to-one mapped to dvs gpio lines.
>> -
>> - [1] If either of the 's5m8767,pmic-buck[2/3/4]-uses-gpio-dvs' optional
>> -     property is specified, then all the eight voltage values for the
>> -     's5m8767,pmic-buck[2/3/4]-dvs-voltage' should be specified.
>> -
>> -Optional properties of the main device node (the parent!):
>> - - s5m8767,pmic-buck2-dvs-voltage: A set of 8 voltage values in micro-volt (uV)
>> -   units for buck2 when changing voltage using gpio dvs. Refer to [1] below
>> -   for additional information.
>> -
>> - - s5m8767,pmic-buck3-dvs-voltage: A set of 8 voltage values in micro-volt (uV)
>> -   units for buck3 when changing voltage using gpio dvs. Refer to [1] below
>> -   for additional information.
>> -
>> - - s5m8767,pmic-buck4-dvs-voltage: A set of 8 voltage values in micro-volt (uV)
>> -   units for buck4 when changing voltage using gpio dvs. Refer to [1] below
>> -   for additional information.
>> -
>> - - s5m8767,pmic-buck2-uses-gpio-dvs: 'buck2' can be controlled by gpio dvs.
>> - - s5m8767,pmic-buck3-uses-gpio-dvs: 'buck3' can be controlled by gpio dvs.
>> - - s5m8767,pmic-buck4-uses-gpio-dvs: 'buck4' can be controlled by gpio dvs.
>> -
>> -Additional properties required if either of the optional properties are used:
>> -
>> - - s5m8767,pmic-buck-default-dvs-idx: Default voltage setting selected from
>> -   the possible 8 options selectable by the dvs gpios. The value of this
>> -   property should be between 0 and 7. If not specified or if out of range, the
>> -   default value of this property is set to 0.
>> -
>> - - s5m8767,pmic-buck-dvs-gpios: GPIO specifiers for three host gpio's used
>> -   for dvs. The format of the gpio specifier depends in the gpio controller.
>> -
>> -
>> -Names of regulators supported by S5M8767 device:
>> -	- LDOn
>> -		  - valid values for n are 1 to 28
>> -		  - Example: LDO1, LDO2, LDO28
>> -	- BUCKn
>> -		  - valid values for n are 1 to 9.
>> -		  - Example: BUCK1, BUCK2, BUCK9
>> -Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
>> -as per the datasheet of device.
>> -
>> -
>> -Optional properties of the nodes under "regulators" sub-node:
>> - - op_mode: describes the different operating modes of the LDO's with
>> -            power mode change in SOC. The different possible values are,
>> -             0 - always off mode
>> -             1 - on in normal mode
>> -             2 - low power mode
>> -             3 - suspend mode
>> - - s5m8767,pmic-ext-control-gpios: (optional) GPIO specifier for one
>> -                                   GPIO controlling this regulator
>> -                                   (enable/disable); This is valid only
>> -                                   for buck9.
>> -
>> -Example:
>> -
>> -	s5m8767_pmic@66 {
>> -		compatible = "samsung,s5m8767-pmic";
>> -		reg = <0x66>;
>> -
>> -		s5m8767,pmic-buck2-uses-gpio-dvs;
>> -		s5m8767,pmic-buck3-uses-gpio-dvs;
>> -		s5m8767,pmic-buck4-uses-gpio-dvs;
>> -
>> -		s5m8767,pmic-buck-default-dvs-idx = <0>;
>> -
>> -		s5m8767,pmic-buck-dvs-gpios = <&gpx0 0 0>, /* DVS1 */
>> -						 <&gpx0 1 0>, /* DVS2 */
>> -						 <&gpx0 2 0>; /* DVS3 */
>> -
>> -		s5m8767,pmic-buck-ds-gpios = <&gpx2 3 0>, /* SET1 */
>> -						<&gpx2 4 0>, /* SET2 */
>> -						<&gpx2 5 0>; /* SET3 */
>> -
>> -		s5m8767,pmic-buck2-dvs-voltage = <1350000>, <1300000>,
>> -						 <1250000>, <1200000>,
>> -						 <1150000>, <1100000>,
>> -						 <1000000>, <950000>;
>> -
>> -		s5m8767,pmic-buck3-dvs-voltage = <1100000>, <1100000>,
>> -						 <1100000>, <1100000>,
>> -						 <1000000>, <1000000>,
>> -						 <1000000>, <1000000>;
>> -
>> -		s5m8767,pmic-buck4-dvs-voltage = <1200000>, <1200000>,
>> -						 <1200000>, <1200000>,
>> -						 <1200000>, <1200000>,
>> -						 <1200000>, <1200000>;
>> -
>> -		regulators {
>> -			ldo1_reg: LDO1 {
>> -				regulator-name = "VDD_ABB_3.3V";
>> -				regulator-min-microvolt = <3300000>;
>> -				regulator-max-microvolt = <3300000>;
>> -				op_mode = <1>; /* Normal Mode */
>> -			};
>> -
>> -			ldo2_reg: LDO2 {
>> -				regulator-name = "VDD_ALIVE_1.1V";
>> -				regulator-min-microvolt = <1100000>;
>> -				regulator-max-microvolt = <1100000>;
>> -				regulator-always-on;
>> -			};
>> -
>> -			buck1_reg: BUCK1 {
>> -				regulator-name = "VDD_MIF_1.2V";
>> -				regulator-min-microvolt = <950000>;
>> -				regulator-max-microvolt = <1350000>;
>> -				regulator-always-on;
>> -				regulator-boot-on;
>> -			};
>> -
>> -			vemmc_reg: BUCK9 {
>> -				regulator-name = "VMEM_VDD_2.8V";
>> -				regulator-min-microvolt = <2800000>;
>> -				regulator-max-microvolt = <2800000>;
>> -				op_mode = <3>; /* Standby Mode */
>> -				s5m8767,pmic-ext-control-gpios = <&gpk0 2 0>;
>> -			};
>> -		};
>> -	};
>> diff --git a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
>> new file mode 100644
>> index 000000000000..3192a06b5ef9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
>> @@ -0,0 +1,83 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/regulator/samsung,s5m8767.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Samsung S5M8767 Power Management IC regulators
>> +
>> +maintainers:
>> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> +
>> +description: |
>> +  This is a part of device tree bindings for S2M and S5M family of Power
>> +  Management IC (PMIC).
>> +
>> +  The S5M8767 provides buck and LDO regulators.
>> +
>> +  See also Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml for
>> +  additional information and example.
>> +
>> +patternProperties:
>> +  # 28 LDOs
>> +  "^LDO([1-9]|1[0-9]|2[0-8])$":
>> +    type: object
>> +    $ref: regulator.yaml#
>> +    description:
>> +      Properties for single LDO regulator.
>> +
>> +    properties:
>> +      regulator-name: true
> 
> This is fine, but technically it is not needed. There's not any 
> requirement that items in 'required' be listed under 'properties'.

I'll skip it here and in further patches - smaller bindings.

> 
>> +
>> +      op_mode:
> 
> Needs a type reference.

Indeed, thanks.

> 
>> +        enum: [0, 1, 2, 3]
>> +        default: 1
>> +        description: |
>> +          Describes the different operating modes of the LDO's with power mode
>> +          change in SOC. The different possible values are:
>> +            0 - always off mode
>> +            1 - on in normal mode
>> +            2 - low power mode
>> +            3 - suspend mode
>> +
>> +    required:
>> +      - regulator-name
>> +
>> +    unevaluatedProperties: false
> 
> On child nodes, I think it's better to place this up with the $ref and 
> 'type: object' since the indentation can be hard to follow. 

OK.


Best regards,
Krzysztof
