Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 698A194AEC
	for <lists+linux-clk@lfdr.de>; Mon, 19 Aug 2019 18:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbfHSQvN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 19 Aug 2019 12:51:13 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44482 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727653AbfHSQvN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Aug 2019 12:51:13 -0400
Received: by mail-pl1-f196.google.com with SMTP id t14so1223613plr.11
        for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2019 09:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PF9Fz7eLOn3KOSJvwuGfd7kZcP+Q82SJirXg7MMKVTc=;
        b=lHOPAntlcr7DvNNnqvGon8PsmC5KmwzxdXbVCIgrhXAtUPzFHwLR9e4ryWdu1nuSuk
         Ehdt/HQ565j7tizRT6Sk1evJ+r63wY5/uqERuNIBq7QSjdswgd8o9TlmUxV2sdkzTM6e
         FKyUhTMwIM0WiojP3BvTlMSmkshvlivGl1p0HdIAq30G3r6AH0HjcXoU8VgRqnnQ0pRj
         SqLM1uvtl61cfFjNTQUe32kc+gBKyyxdYi4luXvShhmmAtzDlRqCI7EE51g38oJtoMDf
         0AjjxTRurHFWz9s+7bWl02zAqVcKU56b+6UDVJi8MTf2bAp97Z0w/OfFjF2Qtrv0KA+j
         WlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PF9Fz7eLOn3KOSJvwuGfd7kZcP+Q82SJirXg7MMKVTc=;
        b=IHNf2F4zx3+NLVomcHLRi8jjstAANsVbAOb43x4kTq/m2i27t17Z++h1QO9KYk2O4V
         BxZ64XmHcM3vhEjmYo/YIMU7GjgPUx+ztvLRoqT7L6Obn924eGKVjpJObIJs3Zsjx2Yv
         FxmV9vYoEMv7zjKW3jIpnw/qGo2jI+nr7H9xMXm1lFt7fr3R5BV/3LOzING0kqKwUrhu
         nIqBJYTtW246rpink3iE340b4BRQZEUu2KQu96OmpJ92oqDWsJsCHhhAecPNo50QQKAO
         SjkDTx3OlVEeU3KvhtdfLtQJk5Y7yKGBsPQm1uvhKQs6JAPPW8Oh5OXICPnUWjxwgRyf
         fYvA==
X-Gm-Message-State: APjAAAXmP0BEBXUhmoDMtEiXuFLm6QOBeVSk35d98vYN0cQR49aVjIaS
        /WqRMBOJNWt5F8XLixhdT3mtpA==
X-Google-Smtp-Source: APXvYqy+GZvqO80ibtH+ku91D+7Ug4tpguKdLphDT0NoWOq2CKeFFjM/+4q4NMDcCteJLySS1DmZEg==
X-Received: by 2002:a17:902:141:: with SMTP id 59mr24103307plb.324.1566233472771;
        Mon, 19 Aug 2019 09:51:12 -0700 (PDT)
Received: from tuxbook-pro (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id i11sm22052392pfk.34.2019.08.19.09.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 09:51:11 -0700 (PDT)
Date:   Mon, 19 Aug 2019 09:52:55 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v2] drivers: qcom: Add BCM vote macro to header
Message-ID: <20190819165255.GA26807@tuxbook-pro>
References: <1565037226-1684-1-git-send-email-jcrouse@codeaurora.org>
 <20190807234232.27AA720880@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807234232.27AA720880@mail.kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 07 Aug 16:42 PDT 2019, Stephen Boyd wrote:

> Quoting Jordan Crouse (2019-08-05 13:33:46)
> > The macro to generate a Bus Controller Manager (BCM) TCS command is used
> > by the interconnect driver but might also be interesting to other
> > drivers that need to construct TCS commands for sub processors so move
> > it out of the sdm845 specific file and into the header.
> > 
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> 
> Unless this is supposed to be applied by me?
> 
> BTW, I wonder why we need an rpm clk driver much at all nowadays, except
> maybe for the XO clk state. The big user, from what I can tell, is the
> interconnect driver and we don't use any of the features of the clk
> framework besides the API to set a frequency. Maybe it would be better
> to just push push the bus frequency logic into interconnect code, then
> XO clk is the only thing we need to keep, and it can be a simple on/off
> thing.
> 

There's been a number of cases where we'll need to enable the buffered
XOs, but perhaps these are handled by other subsystems these days(?)

If so the one case that remains would be the operation of explicitly
holding CXO enabled during operations such as booting the remoteprocs.

Regards,
Bjorn
