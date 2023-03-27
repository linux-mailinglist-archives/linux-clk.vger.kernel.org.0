Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 003566CA0DF
	for <lists+linux-clk@lfdr.de>; Mon, 27 Mar 2023 12:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233483AbjC0KIz (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 27 Mar 2023 06:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233490AbjC0KIq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Mar 2023 06:08:46 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8840C5B8C
        for <linux-clk@vger.kernel.org>; Mon, 27 Mar 2023 03:08:42 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id c9so217905lfb.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Mar 2023 03:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679911721;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1QE/HFk6s3/5mUxX+QTcSpZJVPO7nyaqVrmY4npbtgI=;
        b=ixBFB3su5MCyL3GVcmGdr/rvKgNQiHLNc10/hEO2aez2/upI1XlreWRJLVaOuS12rm
         b6Qu2rfc7cY31qaGWFmzl8o3QbZx9bJSjB1xKcrMxJVEE9VwtaqtbZm/Ir0OdD8x2R3i
         O92stGag13KcdwVN2syZSW7EjN7WplHMlsNefCDjMAl5uzC5XFOs/y4qf8M1wK7n+WZn
         y/ywVHtxl+/Rsw4tgIdl04zmYpd5vgGj8g6L0cKNWF8T+bnuVzmReKm3znlAlwEkPlRW
         8fGtWQQCae91lC/o77S2XFShmbC+DWNvRQM0DEqqwtxBacL/vw6dzgr+Uhn5HwJCiplu
         w9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679911721;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1QE/HFk6s3/5mUxX+QTcSpZJVPO7nyaqVrmY4npbtgI=;
        b=gI/JFeYcBMXgZyJyTL91HBZMgGJH2FDOTP9Ja8mouY4tPM6dSyV/17ovjFFbiMn51J
         Aaq1kJgzCNZETYZjQR7X+1hvpwc/x5HpOnrL9QM22q4mEWRRJrOm1i9GuBRu+UTHd8Wp
         y42bWeq72gFgGQCMQ2bN97sVshS7jYlMdt4RH/h5+tgnofh1LN0oWtm0ndBDYOwSoYqD
         yqBzfd6TTQWrwoojo1efBb00w56IAVeFtNE7YDJOvaB5fCHjnUMMZGVqx6O5msHeRqmW
         CpC60t6zLO9qfgLedNSpyxBU0iKfMb4d+v/WMA45UdWzNxV8CpQHUNtVxNfv3sHEcIDj
         pLCw==
X-Gm-Message-State: AAQBX9e/cEPu0twWSweykKdJKi8AdiPq1/2VPc0INW+NpBCgktb5fFcn
        CDjbZ/ZPhlO3WzYTKuOEaBMBdQ==
X-Google-Smtp-Source: AKy350Yr6aHq7NchYbNKTii70X6B4hH+TTIuQLgtC2Y3cInvCQMxcQSoH4kKYv+qJut7jAuXG36gNg==
X-Received: by 2002:ac2:4464:0:b0:4e8:4d7b:8b92 with SMTP id y4-20020ac24464000000b004e84d7b8b92mr3203236lfl.13.1679911720789;
        Mon, 27 Mar 2023 03:08:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id l21-20020ac24315000000b004b6efcb7bb5sm4600720lfh.169.2023.03.27.03.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 03:08:40 -0700 (PDT)
Message-ID: <b555308f-070a-d982-d8b7-761052eb1b40@linaro.org>
Date:   Mon, 27 Mar 2023 13:08:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 5/8] phy: qcom-qusb2: add QUSB2 support for IPQ9574
Content-Language: en-GB
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1679909245.git.quic_varada@quicinc.com>
 <fdb41b5070461c32590e140064f645ca3d3825b1.1679909245.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <fdb41b5070461c32590e140064f645ca3d3825b1.1679909245.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/03/2023 12:30, Varadarajan Narayanan wrote:
> Add the phy init sequence for the Super Speed ports found
> on IPQ9574.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>   Changes in v2:
>          - Place the entry such that the list continues to be sorted
> ---
>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

