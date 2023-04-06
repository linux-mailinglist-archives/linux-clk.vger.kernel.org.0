Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2236D9514
	for <lists+linux-clk@lfdr.de>; Thu,  6 Apr 2023 13:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237767AbjDFL1z (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 6 Apr 2023 07:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236925AbjDFL1y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Apr 2023 07:27:54 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8691F1FE7
        for <linux-clk@vger.kernel.org>; Thu,  6 Apr 2023 04:27:52 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id n14so21348999plc.8
        for <linux-clk@vger.kernel.org>; Thu, 06 Apr 2023 04:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680780472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VVYIWGq4i6dA7mptOSiojPV+t8IuNlJMGsWdumEtmJY=;
        b=aBRp2TybN8A4n7Pbx5BHPBr1pbUuJ0Fl3dWc1qpre611cKpnH5K0INx9pyGMMEk9x8
         wQnaKbV1klXy7jb+YbVBQrYUiDsfJblpn8ceDB/KqbmfElOnpZIwMpQdqPTrGtKEoNR/
         K/X8g847ziUeBmxzFjfnapI2bhcnXF4GrhB2rGSfR3dsWmCleeOetxcJ7l+ghXmqLbov
         YA2gbbbWaQ0Hh31m3lGLpdYXXCuzpUu3qS5vd96TlI5LYaHyQhWq9gF9EGUaceydiI+y
         /RC6aHNeXi8XUAzb4tzdSh7mhVON3kz3ZhTTSb0XAByM9xQPrL11TkXwg75tVNpKyMTq
         Avmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680780472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVYIWGq4i6dA7mptOSiojPV+t8IuNlJMGsWdumEtmJY=;
        b=rqqNbfXzfcoNLmzM43GtJHZXT2rJoZ5b9mc40JOmSQiRLTQfbw0mJX66giOLqJp4kY
         f5MOuf6mw8aOXsbN9QneQgWFTgwJz5tT44MGQH2fcQJOQi+alpgmOrWuST4p7gYdNdWi
         DP/R28VbrmeB0d1zBHqnUqvk17iCttJQ/Q8ZnxjPm0ffbdKsjmbXZk4R53fuxGT5ZkcZ
         4iBtyEZ18PD0sVeRBoPkb41dOB44XlshIAFszd4wp6NY+qJjpP2LREpdH1w81SLiDfMD
         9jHdLCEpoj+MgxQGTnrD7Rp3eYMKd90i9JDunmB9/YpoRh7BnPm2QX+7NNyZ6iFa/GPX
         yy1w==
X-Gm-Message-State: AAQBX9dDdnU5hhE4aM/tz3NcoeAdOHQh/njvB7TGIfHDAJssMrnIwCvU
        VHA6BGTLYIiAxBsfTRVwLohYXg==
X-Google-Smtp-Source: AKy350b4HH2qgiktRKNUFlB289vs+6SvWgcS7MS+wyHRJKWKtgYCTAhRYwSjZd5dp+CNfj6s+HuwtQ==
X-Received: by 2002:a17:90b:4d90:b0:240:95a7:be70 with SMTP id oj16-20020a17090b4d9000b0024095a7be70mr10383649pjb.19.1680780471973;
        Thu, 06 Apr 2023 04:27:51 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id p13-20020a17090a348d00b002310ed024adsm2973879pjb.12.2023.04.06.04.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 04:27:51 -0700 (PDT)
Date:   Thu, 6 Apr 2023 19:27:39 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, marijn.suijten@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-qcm2290: Mark RCGs shared where applicable
Message-ID: <20230406112739.GA132120@dragon>
References: <20230403174807.345185-1-konrad.dybcio@linaro.org>
 <20230406040433.GA111746@dragon>
 <bb3cdcfa-943e-074d-04f6-bfd8b2cd378d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb3cdcfa-943e-074d-04f6-bfd8b2cd378d@linaro.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Apr 06, 2023 at 01:18:44PM +0200, Konrad Dybcio wrote:
> 
> 
> On 6.04.2023 06:04, Shawn Guo wrote:
> > On Mon, Apr 03, 2023 at 07:48:07PM +0200, Konrad Dybcio wrote:
> >> The vast majority of shared RCGs were not marked as such. Fix it.
> > 
> > It seems we completely missed this shared RCG thing, as vendor drivers
> > do not use it.  Could you help me understand a couple of things?
> > 
> > - How does vendor driver handle shared RCGs?
> See paths with enable_safe_config in e.g. 
> 
> https://git.codelinaro.org/clo/la/kernel/msm-5.4/-/blob/66f3180d36f49f9bf6c1a6712acbb0c75f6ff516/drivers/clk/qcom/clk-rcg2.c

Thanks, Konrad!

For the patch:

Acked-by:  Shawn Guo <shawn.guo@linaro.org>
