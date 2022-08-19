Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81218599D4F
	for <lists+linux-clk@lfdr.de>; Fri, 19 Aug 2022 16:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348487AbiHSOHE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 19 Aug 2022 10:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348442AbiHSOHD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2022 10:07:03 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E57A55F203
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 07:07:01 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id z25so6304597lfr.2
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 07:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Y5wU/lr2kCgDK8lG9CyJ4ihOIqFedal4gpsPlmBBmbM=;
        b=jJWQ0N3ShCM/zS3ZJLsVi+3/exXqeKldfgzmzwJVszO1Ww1nmBEuDkohzSoOFvkiJA
         A12o925w0niqN9C1jXAwBk0UncazuFBREDefU+xo1b1sk8mqVdJ4pNEu8Ds+jwhQoaLn
         VJD+oe/FnqfDaZCMYZ9+3yEY2+IxOZowPAWEIpwJfa3z94ftyfBYxxD4tH9KeAsA/crg
         yLNZ5oHGuWkL5nvShBrZx/kUgl9SABz9u4SBnKHr3x+qStWGNTxwei/YUYmnSRAVqCPE
         YIoLgMTXyctDipZUlXIODar0xVbaSKEY4xc4ZtE1VwNcEHm+kqe3pCINQYOfdeeMskzN
         4HuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Y5wU/lr2kCgDK8lG9CyJ4ihOIqFedal4gpsPlmBBmbM=;
        b=BDPFgw9Sp0d24z2wO6nIknvyAlSyiv0tc5V/hoSV94vMUdvrPO1cwza1fg2O80J0Ne
         30q3dos93yTl0XXBlD4WQoWJu2LHq6wkMakD91jqaiTuV7li91e7v5fSJOCsUH4XaSko
         UsP4sEDvSNnN2kHIznjkla/2jXiSnURD5jds6CEJNBOS7KRNVtDitNooKKI6lVFFXL/U
         W6I2Uidt+h/jbvvZIIuw8oHuj1Y5L7umLfAe6uMan/6kbcInMHoYLDsJTQFcg8ojOHe7
         I9a1sHa8SYQBoaihZm3+bx8UHBvd8/kAnBYDLuSxdwlutOEenoyj70X/KVlfgUDoQIT6
         w5Og==
X-Gm-Message-State: ACgBeo1ThyB/55zGGyKjAQ+D6bk34rCtSpaUwQDm32ilbtFbenVqUdWv
        AqPnw46KWA/4Fq2cVCsp45HaBQ==
X-Google-Smtp-Source: AA6agR56dTKRHSCi5p6LBTjQt57Avyf6is6sSgD+Osdvq9IpZ+Cwxi3NLqgKbOctE3X9RuCkqTobAw==
X-Received: by 2002:ac2:4f15:0:b0:48b:a030:969c with SMTP id k21-20020ac24f15000000b0048ba030969cmr2341253lfr.609.1660918020239;
        Fri, 19 Aug 2022 07:07:00 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id m17-20020a056512359100b00492cd4bd383sm172795lfr.223.2022.08.19.07.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 07:06:59 -0700 (PDT)
Message-ID: <138af26e-8e36-63a0-d3a0-5af866318839@linaro.org>
Date:   Fri, 19 Aug 2022 17:06:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/6] riscv: dts: microchip: add the mpfs' fabric clock
 control
Content-Language: en-US
To:     Conor.Dooley@microchip.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
        Daire.McNamara@microchip.com
Cc:     paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-7-conor.dooley@microchip.com>
 <3df8d4bd-3d38-cecd-6589-ccc1be01b886@linaro.org>
 <3ffba600-bda9-8ffa-a435-9a6f94e072b8@microchip.com>
 <f3d8be5c-737b-8c71-9926-a4036c797769@linaro.org>
 <19ca2ca1-c678-c669-4214-e92416e37191@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <19ca2ca1-c678-c669-4214-e92416e37191@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/08/2022 16:48, Conor.Dooley@microchip.com wrote:
> On 19/08/2022 14:28, Krzysztof Kozlowski wrote:
>>> Maybe that is me exploiting the "should", but I was not sure how to
>>> include the location in the devicetree.
>>
>> Neither node names nor clock names are considered an ABI, but some
>> pieces like to rely on them. Now you created such dependency so imagine
>> someone prepares a DTSI/DTS with "clock-controller" names for all four
>> blocks. How you driver would behave?
> 
> -EEXIST, registration fails in the core.
> 
>> The DTS would be perfectly valid but driver would not accept it
>> (conflicting names) or behave incorrect.
>>
>> I think what you need is the clock-output-names property. The core
>> schema dtschema/schemas/clock/clock.yaml recommends unified
>> interpretation of it - list of names for all the clocks - but accepts
>> other uses, e.g. as a prefix.
> 
> So could I do `clock-output-names = "ccc_nw";`. That would work for me,
> with one question:
> How would I enforce the unique-ness of this property, since it would be
> a per CCC/clock-controller property? Maybe I missed something, but I
> gave it a shot with two different CCC nodes having "ccc_nw" & dtbs_check
> did not complain. Up to me to explain the restriction in the dt-bindings
> description?

Uniqueness among entire DTS? I don't think you can, except of course
mentioning it in description. Your driver should handle such DTS -
minimally by gracefully failing but better behaving in some default way.

> 
> FWIW I would then have:
> ccc_sw: clock-controller@38400000 {
> 	compatible = "microchip,mpfs-ccc";
> 	reg = <0x0 0x38400000 0x0 0x1000>, <0x0 0x38800000 0x0 0x1000>,
> 	      <0x0 0x39400000 0x0 0x1000>, <0x0 0x39800000 0x0 0x1000>;
> 	#clock-cells = <1>;
> 	clock-output-names = "ccc_sw";
> 	status = "disabled";
> };
> 
> & in the binding:
>    clock-output-names:
>      pattern: ^ccc_[ns][ew]$

Yes, although this won't enforce uniqueness.

Best regards,
Krzysztof
