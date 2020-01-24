Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D17C148DA8
	for <lists+linux-clk@lfdr.de>; Fri, 24 Jan 2020 19:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388108AbgAXSRF (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 24 Jan 2020 13:17:05 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:38879 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387755AbgAXSRF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jan 2020 13:17:05 -0500
Received: by mail-pj1-f68.google.com with SMTP id m4so183087pjv.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Jan 2020 10:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8GOUlU1dUUOuhJch2P/ExKUgd2fIeYy+G6rt1qy6jLM=;
        b=R1+ERlRZU9Ah8MrQTR3M1rnLe4Dzto7r2NOpLWs6uMjfb7r0ODwmFXu5hZJuJ8Ahjk
         jbksvHKSehXQD9izfu9/51CbjojukSHw6csATmgZIUoqEaFEUBLi+qMlgvZ4EqBVNc9E
         GNvJIF+K0Dz24/xX8r2LYxkn2MP3y9oJbWotxV4SFWYFnMp7DFoN2pc+W60ZbSExgwtw
         Iq+TArS2Kuvw9GUvHLByPeMWTam2i+G9fTj9QGZEeN9TlCForVmg5R/C6dWKz96k9VZX
         8acbXq33xTZh0GAv0GKBN9vLpvGY2K674kUzY5WUCbToQSZe+TVet01RDLKI5yGa75tF
         tokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8GOUlU1dUUOuhJch2P/ExKUgd2fIeYy+G6rt1qy6jLM=;
        b=fDdhJ0QYzXkF2Zc+1nyeQ4rjSpRJVRif2YqLs25KGHXdoE8Z8MYdWyP0OD08Knjo9B
         It5G+eXVIBwHdjIZ78pPrhYn8fG+0CCwUDqvnD2hGqCVu81zi1Aws/pzEbrqd/JQjyl8
         2NalS/Gz+AlkQFip9ZY+7q9qJpgE0tYYeVJBXU/ZYpA7Zu3PPAnWoCrIOHXKv5awTeu5
         m7agYlun+dIqqnYMgm/dX6W++XR3V8ol0+zkzmh6Wue8ZTEv1RhUvOjR/KIeogE7UVan
         otK/euK8TiQVlgNRh/J5+6Tv3YkwJW0IQALaHWExymJ/Wc2iG+2bWmHtJcESAHUDyVNt
         j0UA==
X-Gm-Message-State: APjAAAVr4l+zI33Sg/P4XMR3b1eNHZRIBGGdtIl1R8SQ6o5+CbenC0b3
        XgkjhIX/ggMl/bUuDiEMcB4nkeD+N30=
X-Google-Smtp-Source: APXvYqyb6oK9L02e/30p7WCm7eAAliDcEOrRt9pFaqipsKNdMSbDlYQgPoEjXdnfrnBxF/+Ak1PXFg==
X-Received: by 2002:a17:90a:d156:: with SMTP id t22mr526439pjw.108.1579889824359;
        Fri, 24 Jan 2020 10:17:04 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z14sm7124542pgj.43.2020.01.24.10.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 10:17:03 -0800 (PST)
Date:   Fri, 24 Jan 2020 10:16:29 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, vinod.koul@linaro.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8250: Add sm8250 dts file
Message-ID: <20200124181629.GT1908628@ripper>
References: <1579217994-22219-1-git-send-email-vnkgutta@codeaurora.org>
 <1579217994-22219-8-git-send-email-vnkgutta@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579217994-22219-8-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 16 Jan 15:39 PST 2020, Venkata Narendra Kumar Gutta wrote:
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
[..]
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <38400000>;
> +			clock-output-names = "xo_board";
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			#clock-cells = <1>;

This should be 0.

> +		};
> +	};
> +
[..]
> +	smem: qcom,smem {

Please drop the "qcom," from the node name.

> +		compatible = "qcom,smem";
> +		memory-region = <&smem_mem>;
> +		hwlocks = <&tcsr_mutex 3>;
> +	};
> +

Regards,
Bjorn
