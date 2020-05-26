Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC5881CFEC2
	for <lists+linux-clk@lfdr.de>; Tue, 12 May 2020 21:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgELT5m (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 12 May 2020 15:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgELT5m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 May 2020 15:57:42 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB12C061A0C
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2020 12:57:42 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x13so986676pfn.11
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2020 12:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1psTwvcMYpTlpczp4vTp5xf7H5Bk+BZ23G7yvOHtOms=;
        b=El/bqf4wDveDEiTDXcScWyBiRrWf6eAeAsz3ooMr11JsFE6beIk89EXPcqbHIcH7F0
         4tNzcwqc8QmWjPm1A+BqT9XyEKpx81sYFEb/7J8JlcE1iOs21Vb6ZnyWV3wSimw6DPGD
         n302fYLzBN0oMvb6jFlLMTizkbyEIvVlwfiKbKrthHm5RsZauiF4i5MxNIjGGqu2QA07
         0TjGDYtgWuOH+pylHcfQrjJGLxVq3i81tsX00lMhd/+3/Da0c5k9OHij/ruxvFraAb1K
         Waks40En5VF8A9SUKdd764BkePOn20EoCmMprVnlXjeQb1nm/0SiF4DNbzooWUv5IHt/
         l2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1psTwvcMYpTlpczp4vTp5xf7H5Bk+BZ23G7yvOHtOms=;
        b=OVwUrHKqWEE5qne5t9K0ifjBP/Qs+2Vvf0lmRFAkpKRaMqUsKqy7AffoPc34F5U0ou
         BHLyHRWcCrMr31bhORnFOlGExy/MYbOrmvLFxEszGVQY8E4iDgzV7Pbs7SMg6If0oBYu
         YzgWDFtnPjKqdhb2ftti+ae//o1Lzn64d5oZTcL1HNoIHB8TLkpRDHED5D9oWCmOFiRA
         Evobr9AkBBxqRjpBkS8PRze8kD6wN0UELzPw3K0TEDmuZcvLZPFGRiecCZ7xG/VHj61s
         jhSzEGIqmjN3lWvTd0UJxe+G0qVIitkNTP4kqS+YwzFCW/Y8INyKaLSU+VqOc1CML9BR
         ZsvQ==
X-Gm-Message-State: AGi0PuYvGnsk54C+7VwmVPYn60J+lUED433hW4OJc7WSCreiVuLAjTEp
        Ep6UpLbvjxeEkGerUsMmiFuquQ==
X-Google-Smtp-Source: APiQypL0VtphI0YrUqP9ATJ5zZvSYtoaqUqrSdwWQ7JLvFmjvSe5bb+FGzlag56wLCaSIPLRqA7QdQ==
X-Received: by 2002:a63:554c:: with SMTP id f12mr21482392pgm.163.1589313461706;
        Tue, 12 May 2020 12:57:41 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t7sm3065968pjf.30.2020.05.12.12.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 12:57:41 -0700 (PDT)
Date:   Tue, 12 May 2020 12:56:08 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 2/8] dt-bindings: clock: Add schema for QCOM IPQ apss
 pll
Message-ID: <20200512195608.GH2165@builder.lan>
References: <1588573224-3038-1-git-send-email-sivaprak@codeaurora.org>
 <1588573224-3038-3-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588573224-3038-3-git-send-email-sivaprak@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun 03 May 23:20 PDT 2020, Sivaprakash Murugesan wrote:

> Add dt-binding for apss pll found on QCOM IPQ platforms
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>

This seems quite similar to the existing qcom,a53pll binding, can't you
just describe both in the same binding?

> ---
>  .../bindings/clock/qcom,ipq-apsspll.yaml           | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq-apsspll.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq-apsspll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq-apsspll.yaml
> new file mode 100644
> index 0000000..dd12ec4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq-apsspll.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,ipq-apsspll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm IPQ APSS PLL Binding
> +
> +maintainers:
> +  - Sivaprakash Murugesan <sivaprak@codeaurora.org>
> +
> +description:
> +  The APSS PLL is the main clock that feds the CPUs on QCOM IPQ platforms.
> +  It can support frequencies above 1GHz.
> +
> +properties:
> +  compatible:
> +    const: qcom,ipq-apss-pll

Allow me to claim that this is not the last IPQ, with an APSS PLL, which
means that this compatible is no good.

I think you want a compatible on the format qcom,ipq<numbers>-a53pll.

Regards,
Bjorn

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: board XO clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    a53pll_ipq: clock@b116000 {
> +        compatible = "qcom,ipq-apss-pll";
> +        reg = <0x0b116000 0x40>;
> +        #clock-cells = <0>;
> +        clocks = <&xo>;
> +        clock-names = "xo";
> +    };
> -- 
> 2.7.4
> 
