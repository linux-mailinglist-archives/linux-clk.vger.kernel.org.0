Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E048715C79
	for <lists+linux-clk@lfdr.de>; Tue, 30 May 2023 13:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbjE3LCD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 30 May 2023 07:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbjE3LCB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 07:02:01 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF5BCD
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 04:01:59 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9707313e32eso840052366b.2
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 04:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685444518; x=1688036518;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mqiWOENTW3CXASLaJvgBSl36DYvfzKWd32k4rlj7DMg=;
        b=H5RC3j865FAkcJKpJ/ImrNlvbdo31/emM6ok7cpJchEr0x4ZdnJzW73LU0aJHGocVV
         iXaCR0WcQn3vCAOZafxYLlnBmYIwdwfhegTN3434QMDH0ofJnlsFWSY7NhSZdrmeMK0P
         zE/7APOBqhl3uaLroZfRizOOBWKccBdmyEl4KH6C6tSg5NLHeuWwdEFOjont8awy7+yz
         6Z3f8LrJSxqkVXGzlP/qlF21fPBe0wBiKcTlsTC006jJMmYxHouEfwhb7Zbj/lXLA3G6
         hT3BarKJkSqwZnPwBaK/Zz+2hGEJVD1BX4TuH8BQaKJKOLKuVfVXjeencjTVOumwne2T
         Vqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685444518; x=1688036518;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqiWOENTW3CXASLaJvgBSl36DYvfzKWd32k4rlj7DMg=;
        b=eNan6n7HWuO8Aup89zCilntDzPBlRupSwDM7VtrpB8vSltNODuHBecptYuyWQUcfr4
         5Mz4Bb5Yq7jyJqtQKHHQzLSpLELhwaAn0XkTxtWH2v7E3gHdAOOH1lN9ZCSKx8T0flr/
         Sp1eRZEqD1VoI2AEmnRMhpO/8Q7tfEzMj3ijffDKeIJeuXw9NBKAjOpuzEQH45r+nFv2
         zCR2/gMCNXAV1FtABfJRmpPb1c2koxA4FmpV/bGSdwr8NvzlhzycTNNST91VrTaN4WJH
         KL+AXowBHRF4XI7xRVgx7xdjuWuFhNPkkGwaWLbeUpVv4HGH1cs2Z/d6/5TA8NMlgggZ
         K3KQ==
X-Gm-Message-State: AC+VfDwagDhxc1LFmRqaGm4lLqWkm6vtGbGUvQAjiDYChTSymJWKGy9Z
        jdxXJm6990GwiVcKJHXUDoi7fw==
X-Google-Smtp-Source: ACHHUZ7EdPsQUATI97T7TTNuUDnDStW+T3FEAeWPo+yfm29Wp4MOkToA00AJYrowOetUBHDSlDJRIg==
X-Received: by 2002:a17:907:2d9f:b0:94e:e97b:c65 with SMTP id gt31-20020a1709072d9f00b0094ee97b0c65mr2301544ejc.60.1685444518085;
        Tue, 30 May 2023 04:01:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id kb9-20020a1709070f8900b00967004187b8sm7195515ejc.36.2023.05.30.04.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 04:01:57 -0700 (PDT)
Message-ID: <514a9e26-aeb9-ce05-1055-337646098ec1@linaro.org>
Date:   Tue, 30 May 2023 13:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V2 04/13] dt-bindings: clock: qcom: gcc-ipq5018: remove q6
 clocks macros
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jassisinghbrar@gmail.com,
        mathieu.poirier@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, quic_eberman@quicinc.com, quic_mojha@quicinc.com,
        kvalo@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com, quic_varada@quicinc.com,
        quic_devipriy@quicinc.com
References: <20230521222852.5740-1-quic_mmanikan@quicinc.com>
 <20230521222852.5740-5-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230521222852.5740-5-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/05/2023 00:28, Manikanta Mylavarapu wrote:
> Since Q6 firmware takes care of bring up clocks in multipd
> model, remove bring up clock macros.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  include/dt-bindings/clock/qcom,gcc-ipq5018.h | 21 --------------------
>  1 file changed, 21 deletions(-)
> 

I am fine with this if it still compiles... I have doubts about it,
unless of some depedencies (you mentioned three !)... but then it gets
complicated.

Keep patches doing same logical change in same patchset. This dependency
dance in recent submissions is making things tricky and prolonging your
upstreaming process significantly.

Best regards,
Krzysztof

