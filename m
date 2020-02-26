Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57A131700C7
	for <lists+linux-clk@lfdr.de>; Wed, 26 Feb 2020 15:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgBZOJy (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 26 Feb 2020 09:09:54 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37528 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727426AbgBZOJt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Feb 2020 09:09:49 -0500
Received: by mail-ed1-f68.google.com with SMTP id t7so3916233edr.4
        for <linux-clk@vger.kernel.org>; Wed, 26 Feb 2020 06:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fXFKoR7odDqKyjm1wlalyPUtaV5JgRAtJWLDNUWDC8E=;
        b=uBz3+g+j8keWl8UqI79zfp5ubt5QR7/jXbEkrRg/FCZsiZGJC3aScHfLMQZxnVbof3
         /QZebawsO2zze1XxLqeBsXC2dsMaenQfIFyIOtbY2d5jk5G7uwQkFUZrYjeLa+zy3DE7
         lzADPtw5KQoK/Pm/ROUTLWxaKS8vLmq7PtHLzzwWCoYi/uqf06dA+oXXNc1vUs/imun1
         GOWPx1wK29lGZ/IcYPHFQbIU6q34VUM+92OI4u3yF1LEl7bMTJirNuZm/atrMNTPRdg5
         ZG/tqQrfoKU+uMNPz9Ru9PJe0pyNk6lFQEORi/37O03LN46FGtKkMXMCRNDMc5vDil1W
         RjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fXFKoR7odDqKyjm1wlalyPUtaV5JgRAtJWLDNUWDC8E=;
        b=P1kJd1Xr190aZEA7IBzz3SOUM58fCfvgyI28y0klW6E2JwP1lKLlPGhYI9EcfUM87P
         Gx65QVw71mbqKlhTZI0jH+2FJiBYU56Mc2DGazZy9aCWfTayawczhcBIgBwoBdch5qeb
         510kQitOrYXbypn0/SMpYdYUDwUTPw9iqqOyUrYqhfYs+BiIkrhIcwnYIJnHzZNH0QSt
         WjqZ6XOU2asI+UEdY5rb+9T0SZwOCOkA7MAOsdPd0p7C1of/Y3A27owd/CL8yErH/0/x
         BG2QwuAbdfczHh4knHWTbWlNcXEpZ1tft+eaL86BOOzuCosnclNPF3sehPdwPJYRw1yY
         fMHA==
X-Gm-Message-State: APjAAAX0wksvGoIVtxJcw+E3COedkFldXlnWiuc23hRN89LpouPQzNxr
        z44++XKQHxPUE0NT8+a2MpoLiA==
X-Google-Smtp-Source: APXvYqw0u4w7Awwn/Oq86trc1VxG309aOYxrpuzvaTjpcOA5sSGDTXcJUngxdDIFv1GDoA39EXuUlA==
X-Received: by 2002:a05:6402:22d4:: with SMTP id dm20mr5099174edb.353.1582726187668;
        Wed, 26 Feb 2020 06:09:47 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id c19sm91152ejm.47.2020.02.26.06.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 06:09:46 -0800 (PST)
Subject: Re: [PATCH v4 0/5] Add clock drivers for SM8250 SoC
To:     Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, tdas@codeaurora.org,
        vnkgutta@codeaurora.org
References: <20200224045003.3783838-1-vkoul@kernel.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
Message-ID: <ada86697-374c-653d-156e-36af61b53c52@nexus-software.ie>
Date:   Wed, 26 Feb 2020 14:09:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224045003.3783838-1-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/02/2020 04:49, Vinod Koul wrote:
> This series adds clock drivers support for SM8250 SoC.  As part of the
> device tree, the sm8250 dts file has basic nodes like CPU, PSCI, intc, timer
> and clock controller.
> 
> Required clock controller driver and RPMH cloks are added to
> support peripherals like USB.
> 
> All this configuration is added to support SM8250 to boot up to the
> serial console.
> 
> Changes in v4:
>   - Make qcom,gcc-sm8250.yaml license as dual GPL + BSD
> 
> Changes in v3:
> - Dropped accepted patches by Steve
> - Split the common rename patch to rename and refactor patches
> - Rebase on clk/clk-qcom and move yaml binding to .../bindings/clock/qcom,gcc-sm8250.yaml
> - Fix comments form Steve on gcc-sm8250 clk driver
> 
> Taniya Das (5):
>    clk: qcom: clk-alpha-pll: Use common names for defines
>    clk: qcom: clk-alpha-pll: Refactor trion PLL
>    clk: qcom: clk-alpha-pll: Add support for controlling Lucid PLLs
>    dt-bindings: clock: Add SM8250 GCC clock bindings
>    clk: qcom: gcc: Add global clock controller driver for SM8250
> 
>   .../bindings/clock/qcom,gcc-sm8250.yaml       |   72 +
>   drivers/clk/qcom/Kconfig                      |    7 +
>   drivers/clk/qcom/Makefile                     |    1 +
>   drivers/clk/qcom/clk-alpha-pll.c              |  264 +-
>   drivers/clk/qcom/clk-alpha-pll.h              |   12 +
>   drivers/clk/qcom/gcc-sm8250.c                 | 3690 +++++++++++++++++
>   include/dt-bindings/clock/qcom,gcc-sm8250.h   |  271 ++
>   7 files changed, 4268 insertions(+), 49 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
>   create mode 100644 drivers/clk/qcom/gcc-sm8250.c
>   create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8250.h
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
