Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B901B95673
	for <lists+linux-clk@lfdr.de>; Tue, 20 Aug 2019 07:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729195AbfHTFHL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 20 Aug 2019 01:07:11 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37648 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728878AbfHTFHK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Aug 2019 01:07:10 -0400
Received: by mail-pg1-f196.google.com with SMTP id d1so2496334pgp.4
        for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2019 22:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=siGlRmES3CYArAMvUtxUgZjvTeUqCgt2pz1SYUMV4/Y=;
        b=IWMRVImvYRK8pwHgogKFBgYB0U5RcLWkYlgDwgnv4FDAfiHcqQI5Mnnl/NRqdHqKne
         hGc6tupZfqvI7YOXNQo7IRMQt0ltXyM2E5H4as7pWdABNqKC3vpz4Rl0KhtuQQmnvY1h
         KVVxGmcGok06MKUzPMtPRcV4RoaHBAS27tEfQeXLENdXd/CSQpjrw79SY1apOUncLdKW
         trkJLFZH8B9+pZPJTPk2hqrRRUPfj1NTbmlfSfWZ/2XeikxQ+UZMaOsuM6BWIXThI/ji
         3c01AnnsEzojR5/mQeNUPcOi7XBGYhfh7hqq579Lqlgb/ZQGOazOUNEbR4Cr37E7Go95
         V9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=siGlRmES3CYArAMvUtxUgZjvTeUqCgt2pz1SYUMV4/Y=;
        b=nc6+xCUtrEzmyoTDWpAHGyxBRAebJgVVGcl1miD2cn2bXOCR5/oQbMpokDmn997voG
         K5SVbCWzg4/lL12ffnkkhf4BONWuNXX8J4HFARSJDFXm6qmH1Dz7caDonh4lC5bN9wc+
         I0DGin6Ru9zPIGD3g7NtnT/mLR0vJq5hHfjjdqcf7FnljuG5wH7NF8BCA7uLGaf7sIwD
         wVlJntM4q/tlWn8DcYOQg/kH4H2ZaUlDoi/Srr+5Hje5wkMW9zHntbS70meiLrJih23s
         08JZiMeE3D5hRURaOtbeTFWUSVsHpH7HwXeKjmRIM7xyGyYsWx+AqHdj1QxmbQuEHqU1
         T8EQ==
X-Gm-Message-State: APjAAAWw2grNYJZPZ1CJwLZQGOXIZ7lLn8jrDiuMJe2l1lUikmMeHclT
        93rhgmcTtldEf1UUfCCfzTlAvQ==
X-Google-Smtp-Source: APXvYqzY4uKVst213z+R6wvTdVnPKjJmmaoOJxnkN2cZ8P6XfjGkdHXyWwS3k3oSHPuU0PiAall6ww==
X-Received: by 2002:aa7:9516:: with SMTP id b22mr27931790pfp.106.1566277630150;
        Mon, 19 Aug 2019 22:07:10 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o67sm7140547pfb.39.2019.08.19.22.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 22:07:09 -0700 (PDT)
Date:   Mon, 19 Aug 2019 22:08:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: clock: Document SM8150 rpmh-clock
 compatible
Message-ID: <20190820050853.GK26807@tuxbook-pro>
References: <20190819073947.17258-1-vkoul@kernel.org>
 <20190819073947.17258-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819073947.17258-4-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 19 Aug 00:39 PDT 2019, Vinod Koul wrote:

> Document the SM8150 rpmh-clock compatible for rpmh clock controller
> found on SM8150 platforms.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> index 8b97968f9c88..365bbde599b1 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> @@ -6,7 +6,9 @@ some Qualcomm Technologies Inc. SoCs. It accepts clock requests from
>  other hardware subsystems via RSC to control clocks.
>  
>  Required properties :
> -- compatible : shall contain "qcom,sdm845-rpmh-clk"
> +- compatible : must be one of:
> +	       "qcom,sdm845-rpmh-clk"
> +	       "qcom,sm8150-rpmh-clk"
>  
>  - #clock-cells : must contain 1
>  - clocks: a list of phandles and clock-specifier pairs,
> -- 
> 2.20.1
> 
