Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3336A6C3012
	for <lists+linux-clk@lfdr.de>; Tue, 21 Mar 2023 12:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjCULRZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 21 Mar 2023 07:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbjCULRY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 07:17:24 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB4D40E2
        for <linux-clk@vger.kernel.org>; Tue, 21 Mar 2023 04:17:20 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id i13so2938512lfe.9
        for <linux-clk@vger.kernel.org>; Tue, 21 Mar 2023 04:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679397438;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtKEJBNyunYjPawzF3HMbeki6+rSmdWQGFTeKC93lS8=;
        b=xP7wVRu4n2NvCx9w5tgDPIrBrnDazF2rn1Ugs5zcZrJrmnsJDdrMMbTNPhVetL+qYt
         VnXYrx/tiqxOrPDiXirqr9fFdv4Z3uYyekA5rBvoqzitMRmO4hULouTlzjUabHJYwH4h
         05/kTRXg8apF86NYLPjVOxxS+mrOW61WidTtm9dGtJt8llPweUPdw4h9iCxFC7OOh1gq
         f5S7HVqNGewrBO3/ocncSILrZDipu3g8Yv/XB6L9g8NEpRPWCuvOUCrN1omtuXyMrOgC
         DTAShJuPqtuZ+TR+/MK7bc7UrldvM8h4BQsXMtGuvAtPQCZV159V5J05KzHOF4F4JJZD
         4vgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679397438;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NtKEJBNyunYjPawzF3HMbeki6+rSmdWQGFTeKC93lS8=;
        b=u57Bu09omg+zpi576NVBZrK/UCwrItBtZbgjxTQK+VgeUyMD/A+D6/RvS1S5I/yFIW
         VuB5a42DMYwTl/8L+YcOZjHwhnp/QxplCL+WBfgWIncUk8BPs0rS8kqiPogIpSQNPgc1
         jR2NARGm5nmVQ+PB1sohPbgL/mO3UrUNwPA1ZB287fZwVPXPJJuO0DQD7cTQbEPziFqj
         53jto9JFvym5RX3XY8ou/j7kN4ZEVuHZWqLGA+ON22WFe3WsnDiejGoCSKxxjMRg8sSq
         jQXwNIUy+w+jvEmKwO22civ2tcRgwJ7Q3vt2ZPlnB1Jv97rJ7n4sDaud2P4eU4O2uvs8
         WCoA==
X-Gm-Message-State: AO0yUKXW70L+mLP3qtbnxAEY05B+PniersjtqpwxCjxThPxnItx4f4Pb
        6LmZwtVw55mHtrpsQSPqgWStYA==
X-Google-Smtp-Source: AK7set/Cu17olUriB8ZQQHQ5Aoy/b9zxovXnsVmvUhfJhKT+otuqfADxe0j3tJFlQHz6V7oAyzVd3Q==
X-Received: by 2002:a05:6512:3a8b:b0:4db:3846:f908 with SMTP id q11-20020a0565123a8b00b004db3846f908mr963454lfu.10.1679397438291;
        Tue, 21 Mar 2023 04:17:18 -0700 (PDT)
Received: from [127.0.0.1] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m2-20020a2e9342000000b00295965f7495sm2174305ljh.0.2023.03.21.04.17.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Mar 2023 04:17:17 -0700 (PDT)
Date:   Tue, 21 Mar 2023 14:17:13 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/8=5D_dt-bindings=3A_phy=3A_q?= =?US-ASCII?Q?com=2Cqusb2=3A_Document_IPQ9574_compatible?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ef5af2e581203e2101773863aa7e1667b4d1b705.1679388632.git.quic_varada@quicinc.com>
References: <cover.1677749625.git.quic_varada@quicinc.com> <cover.1679388632.git.quic_varada@quicinc.com> <ef5af2e581203e2101773863aa7e1667b4d1b705.1679388632.git.quic_varada@quicinc.com>
Message-ID: <69120CDC-19C5-4087-BF71-0ECAB87D018B@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 21 March 2023 11:54:19 GMT+03:00, Varadarajan Narayanan <quic_varada@qu=
icinc=2Ecom> wrote:
>Document the compatible string used for the qusb2 phy in IPQ9574=2E
>
>Acked-by: Krzysztof Kozlowski <krzysztof=2Ekozlowski@linaro=2Eorg>
>Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc=2Ecom>
>
>---
> Changes in v2:
>	- Moved ipq6018 to the proper place and placed ipq9574
>	  next to it as suggested by Dmitry
>---
> Documentation/devicetree/bindings/phy/qcom,qusb2-phy=2Eyaml | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy=2Eyaml =
b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy=2Eyaml
>index 7f403e7=2E=2Eeaecf9b 100644
>--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy=2Eyaml
>+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy=2Eyaml
>@@ -19,12 +19,13 @@ properties:
>       - items:
>           - enum:
>               - qcom,ipq8074-qusb2-phy
>+              - qcom,ipq6018-qusb2-phy
>+              - qcom,ipq9574-qusb2-phy

This still isn't sorted

>               - qcom,msm8953-qusb2-phy
>               - qcom,msm8996-qusb2-phy
>               - qcom,msm8998-qusb2-phy
>               - qcom,qcm2290-qusb2-phy
>               - qcom,sdm660-qusb2-phy
>-              - qcom,ipq6018-qusb2-phy
>               - qcom,sm4250-qusb2-phy
>               - qcom,sm6115-qusb2-phy
>       - items:

--=20
With best wishes
Dmitry
