Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBFC2983AC
	for <lists+linux-clk@lfdr.de>; Wed, 21 Aug 2019 20:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbfHUSvu (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 21 Aug 2019 14:51:50 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35098 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbfHUSvt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Aug 2019 14:51:49 -0400
Received: by mail-ot1-f67.google.com with SMTP id g17so3072942otl.2;
        Wed, 21 Aug 2019 11:51:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SQ8XRe9s8OgNGfo+pt6r4nD44qbzr6uqSHMXlrg8a9A=;
        b=pHm0V85Gx2f2MaMZrETyU9gbC91YYQ31INNBTHyw5PZsbXkpKlXCWW7rv1NQ+7b24P
         lmz/HZMKAEep7mCcqiP+OjjMB6jXSxvDudpSeyK79HYpxWDTbPopSU7ySr+DcKlOmY/I
         ghLTG3aEGqCkFdm3r9ZVfk3XSuLJqOQlH5vg8ynb4gIBSdDN/qiz8GNkzeoAT1VzXMcO
         usNIKcIpVqyqx//MU+IzJQY8qPMLXX2Inv54b4fef1/6AnaVVtbSDeymi5Z0cZvyes95
         ndRSRLfFIMXMoYYlWyXy8iiUHmpE1Ih0kPLJ7jo2hQ7zlECp1mhLVsSexWVmPEfpysQx
         MHaw==
X-Gm-Message-State: APjAAAXhXqJRfOEGq/Lp6IxglTcR3F5cZvbAqsiUy6sHDPwuIec4DCXg
        5FdgdQF+uMdlj2Nc80oy/Q==
X-Google-Smtp-Source: APXvYqwXzBcWF0GaeFGTROhTog9npFAGaJLKDbu3sZo2ZVyY14+eb3RINfrhJbpuLC1LHOD67zdGYA==
X-Received: by 2002:a9d:4c18:: with SMTP id l24mr26368397otf.168.1566413508806;
        Wed, 21 Aug 2019 11:51:48 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 20sm8282639otd.71.2019.08.21.11.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 11:51:48 -0700 (PDT)
Date:   Wed, 21 Aug 2019 13:51:47 -0500
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
Subject: Re: [PATCH 2/8] dt-bindings: ap806: Document AP807 clock compatible
Message-ID: <20190821185147.GA25742@bogus>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com>
 <20190805100310.29048-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805100310.29048-3-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon,  5 Aug 2019 12:03:04 +0200, Miquel Raynal wrote:
> Add AP807 clock compatible to the bindings.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/arm/marvell/ap806-system-controller.txt      | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
