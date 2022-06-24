Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA91B558F52
	for <lists+linux-clk@lfdr.de>; Fri, 24 Jun 2022 05:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbiFXDy3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 23 Jun 2022 23:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbiFXDy2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 23:54:28 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96A45133B
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 20:54:26 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-fb6b4da1dfso2199285fac.4
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 20:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iFT3gQnFCDWatBOiparQTqrGIR1G2w5e82RRo7ggLlU=;
        b=Q0iQp2tThdwD+u12wuvAGNQOIX/m/KPTVJUYMYS5tbSscEyTqCuPmPnDVOVJPyAZGS
         cpfwX49GFplwzgszY4nWTkMRHKE6d5uVs8Js/7uzspGiWRI19N8ay+Eo85otkbLDf7/X
         qAew5o9vscUHdChk5J74Py8FNbv85BqYzpIwW16G8m8ZFEgj6TIAvSbAqzhStmXGUwTG
         ZwnOM6hGssMIjDsxyKVCSKXOOBiANfTDXqLCEjGp4TkrdzvP6QIq/hYfdKVlMLSlRvEb
         LKE1TCce3PNdhZT3xU9OYjxkF4TSQSL1JVtQKDy6dhMYNdek6DDYwcI0UcCAN2VKH4Fy
         E2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iFT3gQnFCDWatBOiparQTqrGIR1G2w5e82RRo7ggLlU=;
        b=xyiFTYKWOsLTCg2JojXRAgOvKYN9CVAsY8Ad7fnzgC3sxnspqZlkxEMht3WZLq9VQN
         9QhZivHtjExchFUF1Kzq4iq6xbOi2AkhQOKyZ4rLyuH3larrhXh8jkRHODQpgGZNHp81
         7JiCLd/ll8S+k+RWhWlFp2LcnOxCFoRWX/V1j9BWD6e7d6HY/N46rh+t/xSni8tYp12V
         taq5Nu8cmnjBhXwwOAVcvipYqQ/4GqmPQcaA6eP6sCdaCK8AliT9ztsDbcwqFmcAhq50
         ugMVoO34ETjyECsutad6+foKXU0wBXwlrZgPybw61K7MoHlB8BE0EYDeZU9m2CAP+dDy
         2Mhg==
X-Gm-Message-State: AJIora/TAfgWY1cJIJD1ZNMQNX09c7ZpPxro6zguHp2vbCEquu2c8ZZT
        RMwJKy7TzT8a/O4Shy4ayMmeaw==
X-Google-Smtp-Source: AGRyM1viJEexCKUErsqTQhjYnEudnwnMhiqAJInvRUG+lD1YBOkBoOwMbz7X6qYfU1nlVaHfb9LctA==
X-Received: by 2002:a05:6870:d10c:b0:102:820:1231 with SMTP id e12-20020a056870d10c00b0010208201231mr865943oac.122.1656042866308;
        Thu, 23 Jun 2022 20:54:26 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p2-20020a05680811c200b0032e3ffc5513sm595717oiv.4.2022.06.23.20.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 20:54:25 -0700 (PDT)
Date:   Thu, 23 Jun 2022 22:54:23 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sricharan R <quic_srichara@quicinc.com>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, p.zabel@pengutronix.de,
        quic_varada@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 5/8] pinctrl: qcom: Add IPQ5018 pinctrl driver
Message-ID: <YrU1b+37DeZqIMTh@builder.lan>
References: <20220621161126.15883-1-quic_srichara@quicinc.com>
 <20220621161126.15883-6-quic_srichara@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621161126.15883-6-quic_srichara@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 21 Jun 11:11 CDT 2022, Sricharan R wrote:
[..]
> +
> +static const struct of_device_id ipq5018_pinctrl_of_match[] = {
> +	{ .compatible = "qcom,ipq5018-pinctrl", },

Please make this qcom,ipq5018-tlmm, as requested in the binding.

With that:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
