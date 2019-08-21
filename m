Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79C58983A7
	for <lists+linux-clk@lfdr.de>; Wed, 21 Aug 2019 20:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbfHUSv3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 21 Aug 2019 14:51:29 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:47042 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727491AbfHUSv3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Aug 2019 14:51:29 -0400
Received: by mail-ot1-f67.google.com with SMTP id z17so3011222otk.13;
        Wed, 21 Aug 2019 11:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PJrTASEKayF/rEeulkvx0sHH3TMvgVsWZZSoMN8GMAU=;
        b=JC9OennyzjiXnnoLx6e3k2vgr3QSngfK965NTFI8BDiIloIyD+xnI8rUgOIueSjGlW
         lCKiVVUDBwRN5vuNiH7Eq07B0bhuAnRMUfL83UaVN423ynOR049Ei9z1NaEKR4mcyGI/
         eZJBrZS+Lftr+Z3wQsJ0QLBzkrJ991/phIeoUnxcDsaLB+3OQUNo17EUBZD7frBHEaA6
         fNABRmmKqS6C1hDdoOXjftAlRT2+gjxmFA9qtWjTwPfXd6fKbdg0YfztSzx8xOf+e/Fs
         l5GHRFmVf/hmsMMasDwfm4dhfZu8m85x1EvCb5QU8pUVQcqdyMDd/dtQR28n8ZlROral
         b3WA==
X-Gm-Message-State: APjAAAVr7rPVVlJnE0Na4stLJmBKP9rfsDppgmtM4Wv2xnDxxeA9W5gw
        pxsf4QRi7eU0oJRU1mZlCA==
X-Google-Smtp-Source: APXvYqy/UXU8uOcZSwzz0A/lzHXwsb1CAH8//XJMJZG5y+0bXA8CBfoaG1iAIXPUrRvACjt97pkFXA==
X-Received: by 2002:a9d:1d5:: with SMTP id e79mr27405987ote.98.1566413488485;
        Wed, 21 Aug 2019 11:51:28 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u5sm8754198ote.27.2019.08.21.11.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 11:51:28 -0700 (PDT)
Date:   Wed, 21 Aug 2019 13:51:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Stefan Chulski <stefanc@marvell.com>,
        Yan Markman <ymarkman@marvell.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/8] dt-bindings: ap80x: Document AP807 CPU clock
 compatible
Message-ID: <20190821185127.GA24995@bogus>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com>
 <20190805100310.29048-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805100310.29048-2-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon,  5 Aug 2019 12:03:03 +0200, Miquel Raynal wrote:
> Add AP807 CPU clock compatible to the bindings.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/arm/marvell/ap806-system-controller.txt     | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
